require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require 'date'

def list_all_books(library)
  books = library.list_all_books
  books.each { |book| puts book }
end

def list_all_people(library)
  people = library.list_all_people
  people.each { |person| puts person }
end

def create_person(library)
  puts 'Enter person details:'
  print 'Name: '
  name = gets.chomp
  print 'Age: '
  age = gets.chomp.to_i
  print 'Role (teacher or student): '
  role = gets.chomp.downcase

  if role == 'teacher'
    print 'Subject: '
    subject = gets.chomp
    library.create_teacher(name, age, subject)
  elsif role == 'student'
    print 'Grade: '
    grade = gets.chomp.to_i
    library.create_student(name, age, grade)
  else
    puts "Invalid role. Please choose either 'teacher' or 'student'."
  end
end

def create_book(library)
  puts 'Enter book details:'
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  print 'ISBN: '
  isbn = gets.chomp

  library.create_book(title, author, isbn)
end

def create_rental(library)
  puts 'Enter rental details:'
  print 'Person ID: '
  person_id = gets.chomp.to_i
  print 'Book ID: '
  book_id = gets.chomp.to_i

  library.create_rental(person_id, book_id)
end

def list_rentals_for_person(library)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i

  rentals = library.list_rentals_for_person(person_id)
  rentals.each { |rental| puts rental }
end
