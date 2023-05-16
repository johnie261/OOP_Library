equire_relative 'nameable'

class BaseDecorator < Nameable
  attr_accessor :component

  def initialize(component)
    super
    @component = component
  end

  def correct_name
    component.correct_name
  end
end
