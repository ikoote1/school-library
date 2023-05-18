require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown',parent_permission)
    super()
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = true
    @rentals = []
  end

  attr_accessor :name, :age, :parent_permission :rentals
  attr_reader :id

  def correct_name
    name
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
