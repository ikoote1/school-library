require './nameable'

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

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    trimmed_name = @nameable.correct_name[0..9]
    trimmed_name.length < @nameable.correct_name.length ? trimmed_name : @nameable.correct_name
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_Person = CapitalizeDecorator.new(person)
puts capitalized_Person.correct_name
capitalized_Trimmed_Person = TrimmerDecorator.new(capitalized_Person)
puts capitalized_Trimmed_Person.correct_name
