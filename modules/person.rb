require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown')
    super()
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = true
    @rentals = []
  end

  attr_accessor :name, :age, :rentals
  attr_reader :id

  def correct_name
    name
  end

  def rent_book(rental)
    @rentals << rental
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
