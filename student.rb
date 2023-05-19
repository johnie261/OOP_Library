require_relative 'persons'

class Student < Person
  attr_accessor :classroom

  def initialize( name:, parent_permission: true, classroom: nil)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
