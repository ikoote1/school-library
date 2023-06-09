require 'json'
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

  def save_data
    save_books
    save_people
    save_rentals
  end

  def selected_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
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
        puts "[Student] Name: #{person.name}, ID: #{person.id},
         Parent Permission: #{person.parent_permission}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "Name: #{person.name}"
      end
      puts "\n"
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'
    choice = gets.chomp

    if choice == '1'
      create_student
    elsif choice == '2'
      create_teacher
    else
      puts 'Your input is wrong!'
    end
  end

  def create_student
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.upcase == 'Y'
    student = Student.new(age, parent_permission, name)
    @people.push(student)
    puts 'You added the student successfully'
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'You added the teacher successfully'
  end

  def add_person(person)
    @people.push(person)
  end

  def save_people
    File.write('people.json', @people.to_json)
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def save_books
    File.write('books.json', @books.to_json)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    books_with_index
    selected_book = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID)'
    people_with_index
    selected_person = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    book = @books[selected_book]
    person = @people[selected_person]
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def save_rentals
    File.write('rentals.json', @rentals.to_json)
  end

  def list_rentals
    print 'To see person rentals enter the person Name: '
    name = gets.chomp.to_s
    puts 'Rented Books:'
    @rentals.each do |rental|
      person = rental.instance_variable_get(:@person)
      person_name = person.instance_variable_get(:@name)

      next unless person_name == name

      book = rental.instance_variable_get(:@book)
      title = book.instance_variable_get(:@title)
      author = book.instance_variable_get(:@author)
      puts "Date: #{rental.date} Book: #{title} by Author: #{author} "
    end
  end

  def books_with_index
    @books.each_with_index do |book, index|
      text = "#{index}: "
      book.instance_variables.each do |var|
        val = book.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}:#{val} " unless var.include?('rentals') || var.include?('classroom')
      end
      puts text
    end
  end

  def people_with_index
    @people.each_with_index do |person, index|
      text = "#{index}: "
      person.instance_variables.each do |var|
        val = person.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}:#{val} " unless var.include?('rentals') || var.include?('classroom')
      end
      puts text
    end
  end
end
