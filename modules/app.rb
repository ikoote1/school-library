require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'classroom'
require_relative 'person'

class App
  attr_accessor :books, :rentals, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def selected_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person(self)
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      puts 'Please select a valid option from the list!'
    end
  end

  def list_books
    @books.each do |book|
      book.instance_variables.each do |var|
        text = ''
        value = book.instance_variable_get(var)
        var = var.to_s.delete('@')
        var = var.capitalize
        text += "#{var}:#{value}" unless var.include?('Rentals')
        puts text
      end
    end
  end

  def list_people
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.object_id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.object_id}, Age: #{person.age}"
      else
        puts "Name: #{person.name}"
      end
      puts "\n"
    end
  end

  def create_student(age, name, parent_permission)
    if
