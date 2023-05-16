require_relative 'nameable'

class BaseDecorator < Nameable
  attr_accessor :component

  def initialize(component)
    @component = component
    super()
  end

  def correct_name
    component.correct_name
  end
end
