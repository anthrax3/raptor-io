# -*- coding: binary -*-
module RaptorIO
module Protocol
module NTLM
module Exceptions

class NTLMMissingChallenge < ::RuntimeError
  def to_s
    "Unable to complete, no challenge key found"
  end
end

end
end
end
end

