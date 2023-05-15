class Person
    def initialize (name = 'Unknown',age,parent_permission = true)
        @id = Random.rand(1..10000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
    def id
        @id
    end
    def name
        @name
    end
    def age
        @age
    end

    def name=(new_name)
        @name = new_name
    end

    def age=(new_age)
        @age = new_age
    end
    private
    def of_age?
        @age >= 18
    end
    public
    def can_use_services?
        of_age? || parent_permission
    end
end

