require_relative 'book'
require_relative 'person'
require_relative 'rental'
require 'date'

book = Book.new('Title', 'Author')
person = Person.new(25, true, 'John Doe')
date = Date.today

person.rent_book(book, date)
book.add_rental(person, date)
