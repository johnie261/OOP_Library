require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  # getters for id, name and age
  attr_reader :id, :parent_permission
  attr_accessor :name, :age, rentals

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
    @rentals = []
  end

  # public method which is calling the private method
  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
  end

  # declare a private method
  private

  def of_age?
    @age >= 18
  end
end

# usage example
person = Person.new(age: 22, name: 'maximilianus')
decorated_person = CapitalizeDecorator.new(TrimmerDecorator.new(person))
puts decorated_person.correct_name # maximilian
