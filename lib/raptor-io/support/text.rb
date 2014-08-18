# -*- coding: binary -*-
require 'digest/md5'
require 'digest/sha1'
require 'stringio'
require 'cgi'

%W{ iconv zlib }.each do |libname|
  begin
    old_verbose = $VERBOSE
    $VERBOSE = nil
    require libname
  rescue ::LoadError
  ensure
    $VERBOSE = old_verbose
  end
end

module RaptorIO::Support

###
#
# This class formats text in various fashions and also provides
# a mechanism for wrapping text at a given column.
#
###
module Text
  AllChars = [*(0x00 .. 0xff)].pack("C*")

  # Generates a random character.
  def self.rand_char(bad, chars = AllChars)
    rand_text(1, bad, chars)
  end

  # Base text generator method
  def self.rand_base(len, bad, *foo)
    cset = (foo.join.unpack("C*") - bad.to_s.unpack("C*")).uniq
    return "" if cset.length == 0
    outp = []
    len.times { outp << cset[rand(cset.length)] }
    outp.pack("C*")
  end

  # Generate random bytes of data
  def self.rand_text(len, bad='', chars = AllChars)
    foo = chars.split('')
    rand_base(len, bad, *foo)
  end

  # Generate random bytes of alpha data
  def self.rand_text_alpha(len, bad='')
    foo = []
    foo += ('A' .. 'Z').to_a
    foo += ('a' .. 'z').to_a
    rand_base(len, bad, *foo )
  end

  # Generate random bytes of lowercase alpha data
  def self.rand_text_alpha_lower(len, bad='')
    rand_base(len, bad, *('a' .. 'z').to_a)
  end

  # Generate random bytes of uppercase alpha data
  def self.rand_text_alpha_upper(len, bad='')
    rand_base(len, bad, *('A' .. 'Z').to_a)
  end

  # Generate random bytes of alphanumeric data
  def self.rand_text_alphanumeric(len, bad='')
    foo = []
    foo += ('A' .. 'Z').to_a
    foo += ('a' .. 'z').to_a
    foo += ('0' .. '9').to_a
    rand_base(len, bad, *foo )
  end

  # Generate random bytes of alphanumeric hex.
  def self.rand_text_hex(len, bad='')
    foo = []
    foo += ('0' .. '9').to_a
    foo += ('a' .. 'f').to_a
    rand_base(len, bad, *foo)
  end

  # Generate random bytes of numeric data
  def self.rand_text_numeric(len, bad='')
    foo = ('0' .. '9').to_a
    rand_base(len, bad, *foo )
  end

  # Generate random bytes of english-like data
  def self.rand_text_english(len, bad='')
    foo = []
    foo += (0x21 .. 0x7e).map{ |c| c.chr }
    rand_base(len, bad, *foo )
  end

  # Generate random bytes of high ascii data
  def self.rand_text_highascii(len, bad='')
    foo = []
    foo += (0x80 .. 0xff).map{ |c| c.chr }
    rand_base(len, bad, *foo )
  end

  #
  # Pack a value as 64 bit litle endian; does not exist for Array.pack
  #
  def self.pack_int64le(val)
    [val & 0x0000_0000_ffff_ffff, val >> 32].pack("V2")
  end

end
end

