# -*- coding: binary -*-
module RaptorIO
module Protocol
module SMB
class SimpleClient

require 'raptor-io/support/text'
require 'raptor-io/support/struct2'
require 'raptor-io/protocol/smb/constants'
require 'raptor-io/protocol/smb/exceptions'
require 'raptor-io/protocol/smb/evasions'
require 'raptor-io/protocol/smb/crypt'
require 'raptor-io/protocol/smb/utils'
require 'raptor-io/protocol/smb/client'
require 'raptor-io/protocol/smb/simpleclient/open_file'
require 'raptor-io/protocol/smb/simpleclient/open_pipe'

# Some short-hand class aliases
CONST = RaptorIO::Protocol::SMB::Constants
CRYPT = RaptorIO::Protocol::SMB::Crypt
UTILS = RaptorIO::Protocol::SMB::Utils
XCEPT = RaptorIO::Protocol::SMB::Exceptions
EVADE = RaptorIO::Protocol::SMB::Evasions

# Public accessors
attr_accessor :last_error

# Private accessors
attr_accessor :socket, :client, :direct, :shares, :last_share

  # Pass the socket object and a boolean indicating whether the socket is netbios or cifs
  def initialize(socket, direct = false)
    self.socket = socket
    self.direct = direct
    self.client = RaptorIO::Protocol::SMB::Client.new(socket)
    self.shares = { }
  end

  def login(name = '', user = '', pass = '', domain = '',
      verify_signature = false, usentlmv2 = false, usentlm2_session = true,
      send_lm = true, use_lanman_key = false, send_ntlm = true,
      native_os = 'Windows 2000 2195', native_lm = 'Windows 2000 5.0', spnopt = {})

    begin

      if (self.direct != true)
        self.client.session_request(name)
      end
      self.client.native_os = native_os
      self.client.native_lm = native_lm
      self.client.verify_signature = verify_signature
      self.client.use_ntlmv2 = usentlmv2
      self.client.usentlm2_session = usentlm2_session
      self.client.send_lm = send_lm
      self.client.use_lanman_key =  use_lanman_key
      self.client.send_ntlm = send_ntlm

      self.client.negotiate

      # Disable NTLMv2 Session for Windows 2000 (breaks authentication on some systems)
      # XXX: This in turn breaks SMB auth for Windows 2000 configured to enforce NTLMv2
      # XXX: Tracked by ticket #4785#4785
      if self.client.native_lm =~ /Windows 2000 5\.0/ and usentlm2_session
      #	self.client.usentlm2_session = false
      end

      self.client.spnopt = spnopt

      ok = self.client.session_setup(user, pass, domain)
    rescue ::Interrupt
      raise $!
    rescue ::Exception => e
      n = XCEPT::LoginError.new
      n.source = e
      if(e.respond_to?('error_code'))
        n.error_code   = e.error_code
        n.error_reason = e.get_error(e.error_code)
      end
      raise n
    end

    return true
  end


  def login_split_start_ntlm1(name = '')

    begin

      if (self.direct != true)
        self.client.session_request(name)
      end

      # Disable extended security
      self.client.negotiate(false)
    rescue ::Interrupt
      raise $!
    rescue ::Exception => e
      n = XCEPT::LoginError.new
      n.source = e
      if(e.respond_to?('error_code'))
        n.error_code   = e.error_code
        n.error_reason = e.get_error(e.error_code)
      end
      raise n
    end

    return true
  end


  def login_split_next_ntlm1(user, domain, hash_lm, hash_nt)
    begin
      ok = self.client.session_setup_no_ntlmssp_prehash(user, domain, hash_lm, hash_nt)
    rescue ::Interrupt
      raise $!
    rescue ::Exception => e
      n = XCEPT::LoginError.new
      n.source = e
      if(e.respond_to?('error_code'))
        n.error_code   = e.error_code
        n.error_reason = e.get_error(e.error_code)
      end
      raise n
    end

    return true
  end

  def connect(share)
    ok = self.client.tree_connect(share)
    tree_id = ok['Payload']['SMB'].v['TreeID']
    self.shares[share] = tree_id
    self.last_share = share
  end

  def disconnect(share)
    ok = self.client.tree_disconnect(self.shares[share])
    self.shares.delete(share)
  end


  def open(path, perm, chunk_size = 48000)
    mode   = UTILS.open_mode_to_mode(perm)
    access = UTILS.open_mode_to_access(perm)

    ok = self.client.open(path, mode, access)
    file_id = ok['Payload'].v['FileID']
    fh = OpenFile.new(self.client, path, self.client.last_tree_id, file_id)
    fh.chunk_size = chunk_size
    fh
  end

  def delete(*args)
    self.client.delete(*args)
  end

  def create_pipe(path, perm = 'c')
    disposition = UTILS.create_mode_to_disposition(perm)
    ok = self.client.create_pipe(path, disposition)
    file_id = ok['Payload'].v['FileID']
    fh = OpenPipe.new(self.client, path, self.client.last_tree_id, file_id)
  end

  def trans_pipe(fid, data, no_response = nil)
    client.trans_named_pipe(fid, data, no_response)
  end

end
end
end
end

