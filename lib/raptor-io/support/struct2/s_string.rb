# -*- coding: binary -*-

# RaptorIO::Support::Struct2
module RaptorIO::Support
module Struct2

class SString

  require 'raptor-io/support/struct2/element'
  require 'raptor-io/support/struct2/constant'
  include RaptorIO::Support::Struct2::Element

  attr_reader  :size, :default, :pad
  attr_writer  :default, :pad

  def initialize(size=nil, default=nil, pad=nil)
    self.size = size
    @default  = default
    @pad      = pad
    reset()
  end

  def size=(newsize)
    if !newsize
      self.restraint = nil
    else
      res = RaptorIO::Support::Struct2::Constant.new(newsize)
      self.restraint = RaptorIO::Support::Struct2::Restraint.new(res, res, false)
    end
  end

  def reset
    self.value = @default
  end

  def to_s
    string = self.value

    return if !string

    # pad if short
    if restraint && restraint.min && self.pad && restraint.min > string.length
      string += self.pad * (restraint.min - string.length)
    end
    # truncate if long
    if restraint && restraint.max
      string = string.slice(0, restraint.max)
    end

    return string
  end

  def from_s(bytes)
    # we don't have enough bytes to satisfy our minimum
    if restraint && restraint.min && bytes.length < restraint.min
      return
    end

    if restraint && restraint.max
      self.value = bytes.slice(0, restraint.max)
    else
      self.value = bytes.dup
    end


    return(self.slength)
  end
end

# end RaptorIO::Support::Struct2
end
end
