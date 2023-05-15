require "./person.rb"
class Teacher < Person
    def initialize
        super(specialization)
        @specialization = specialization
    end
end