# -*- coding: binary -*-

# RaptorIO::Support::Struct2
module RaptorIO::Support
module Struct2

# this is a "constant" element.  It's not actually constant, you can set it
# via the constructor and value.  It doesn't do from_s/to_s, etc.

# what use is it? Well it's useful for doing constant restraints (like fix
# sized arrays), and probably not a ton more.

class Constant

  require 'raptor-io/support/struct2/element'
  include RaptorIO::Support::Struct2::Element

  def initialize(value)
    self.value = value
  end

end

# end RaptorIO::Support::Struct2
end
end
