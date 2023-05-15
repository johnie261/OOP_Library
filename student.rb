require_relative 'persons'

class Student < Person
    def initialize(name: "Unknown", age:, parent_permission: true, classroom:)
        super(name: name, age: age, parent_permission: parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end


#checking instances of class and testing the functionality:
student = Student.new(name: "John", age: 18, parent_permission: true, classroom: "Physics")

puts "Name: #{student.name}"
puts "Age: #{student.age}"

puts "Can use services? #{student.can_use_services?}"
puts "Playing hooky: #{student.play_hooky}"