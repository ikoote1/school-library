require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown')
    super()
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = true
  end

  attr_accessor :name, :age
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



person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = DrimmerDecorator.new(capitalized_Person)
puts capitalized_trimmed_person.correct_name
