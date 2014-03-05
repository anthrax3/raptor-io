
module RaptorIO::Protocol::SMB
  class Client
    attr_accessor :socket

    # @param socket [RaptorIO::Socket] A connected socket
    def initialize(socket)
      @socket = socket
    end

  end
end

