require 'json'
require_relative 'app'
class Main

  def load_data
    load_books
    load_people
    load_rentals
  end

  def load_books
    if File.exist?('books.json')
      books_data = JSON.parse(File.read('books.json'))
      books_data.each do |book_data|
        book = Book.new(book_data['title'], book_data['author'])
        @app.books.push(book)
      end
    end
  end

  def load_people
    if File.exist?('people.json')
      people_data = JSON.parse(File.read('people.json'))
      people_data.each do |person_data|
        if person_data['type'] == 'student'
          student = Student.new(person_data['age'], person_data['parent_permission'], person_data['name'])
          @app.people.push(student)
        elsif person_data['type'] == 'teacher'
          teacher = Teacher.new(person_data['age'], person_data['name'], person_data['specialization'])
          @app.people.push(teacher)
        else
          person = Person.new(person_data['name'])
          @app.people.push(person)
        end
      end
    end
  end

  def load_rentals
    if File.exist?('rentals.json')
      rentals_data = JSON.parse(File.read('rentals.json'))
      rentals_data.each do |rental_data|
        book = find_book_by_id(rental_data['book_id'])
        person = find_person_by_id(rental_data['person_id'])
        rental = Rental.new(rental_data['date'], book, person)
        @app.rentals.push(rental)
      end
    end
  end

  def find_book_by_id(id)
    @app.books.find { |book| book.object_id == id }
  end

  def find_person_by_id(id)
    @app.people.find { |person| person.object_id == id }
  end

  def choose_option
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit!'
  end

  def start
    new_app = App.new
    puts 'Welcome to School Library App!'
    loop do
      choose_option
      option = gets.chomp
      break if option == '7'

      new_app.selected_option(option)
    end
  end

  def create_person(new_app)
    puts 'Do you want to create a student(1) or a teacher(2)?'
    choice = gets.chomp
    if choice == '1'
      create_student(new_app)
    elsif choice == '2'
      create_teacher(new_app)
    else
      puts 'Your input is wrong!'
    end
  end

  def create_student(new_app)
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.upcase == 'Y'
    student = Student.new(age, parent_permission, name)
    new_app.add_person(student)
    puts 'You added the student successfully'
  end

  def create_teacher(new_app)
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    new_app.add_person(teacher)
    puts 'You added the teacher successfully'
  end
end

def main
  app = Main.new
  app.start
end
main
