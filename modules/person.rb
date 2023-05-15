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

    def od_age?
        if(age > 18)
            true
        elsif
            false
        end
    end

    def can_use_services?
        if(age>18 || parent_permission == true)
            true
        end
    end
end