class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date,book,person)
    @date = date
    @book = book
    book.add_rental(self
  end

  def get_book(book)
    
  end

  def person_rent(person)
    @person = person
    person.rent_book(self)
  end
end
