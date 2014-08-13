# -*- coding: binary -*-

# RaptorIO::Support::Struct2
module RaptorIO::Support
module Struct2

class CStructTemplate

  require 'raptor-io/support/struct2/c_struct'

  attr_reader  :template, :template_create_restraints, :template_apply_restraint
  attr_writer  :template, :template_create_restraints, :template_apply_restraint

  def initialize(*tem)
    self.template = tem
    self.template_create_restraints = [ ]
    self.template_apply_restraint = [ ]
  end

  def create_restraints(*ress)
    self.template_create_restraints = ress
    return self
  end

  def apply_restraint(*ress)
    self.template_apply_restraint = ress
    return self
  end

  def make_struct
    RaptorIO::Support::Struct2::CStruct.new(*self.template).
      create_restraints(*self.template_create_restraints).
      apply_restraint(*self.template_apply_restraint)
  end
end

# end RaptorIO::Support::Struct2
end
end
