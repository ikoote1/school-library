require "./nameable.rb"

 class Person < Nameable
  def initialize(age, name = 'Unknown')
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
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name
