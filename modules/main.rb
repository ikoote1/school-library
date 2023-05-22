require_relative 'app'
class Main
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
    student = Student.new(age, name, parent_permission)
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