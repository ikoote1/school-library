class Person
  def initialize(age, name = 'Unknown')
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    #   @parent_permission = parent_permission
  end
  # def id
  #     @id
  # end
  # def name
  #     @name
  # end
  # def age
  #     @age
  # end

  # def name=(new_name)
  #     @name = new_name
  # end

  # def age=(new_age)
  #     @age = new_age
  # end
  # private
  # def of_age?
  #     @age >= 18
  # end
  # public
  # def can_use_services?
  #     of_age? || parent_permission
  # end
end
