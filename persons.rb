class Person
    #getters for id, name and age
    attr_reader :id, :name, :age, :parent_permission
    
    def initialize(name: "Unknown", age:, parent_permission: true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    #setter for name and age
    def name=(new_name)
        @name = new_name
    end

    def age=(new_age)
        @age = new_age
    end

    #public method which is calling the private method
    def can_use_services?
        of_age? || @parent_permission
    end

    #declare a private method
    private

    def of_age?
        @age >= 18 ? true : false
    end
end

