class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement correct_name'
  end
end

class Person < Nameable
  # getters for id, name and age
  attr_reader :id, :parent_permission
  attr_accessor :name, :age

  def initialize(age:, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # public method which is calling the private method
  def can_use_services?
    of_age? || @parent_permission
  end

  # declare a private method
  private

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end
end
