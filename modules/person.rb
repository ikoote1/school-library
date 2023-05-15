class Person
    def initialize (name = 'Unknown',age,parent_permission = true)
        @id = Random.rand(1..10000)
        @name = name
        @age = age
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
        if(age >= 18)
            true
        else
            false
        end
    end
    public
    def can_use_services?
        of_age? || parent_permission
    end
end

class Student < Person

end
