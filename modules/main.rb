# require_relative 'book'
# require_relative 'person'
# require_relative 'rental'
# require 'date'

 def main
    library = library.new

    loop do
        puts "\nWelcome to school Library App!"
        puts "\n Please choose an option by entering a number"
        puts "1 - List all books"
        puts "2 - List all people"
        puts "3 - Create a person"
        puts "4 - Create a book"
        puts "5 - Create a rental"
        puts "6 - List all retals for a given person id"
        puts "7 - Exit"
        
        print "\nEnter your choice:"
        choice = gets.chomp.to_i

        case choice
        when 1
            list_all_books(library)
        when 2
            list_all_people(library)
        when 3
          create_person(library)
        when 4
          create_book(library)
        when 5
          create_rental(library)
        when 6
          list_rentals_for_person(library)
        when 7
          break
        else
            puts "Invalid choice. Please enter a number from 1 to 7."
        end
    end
end

main
