class Rental
  attr_accessor :date, :book, :person

  def initialize(date,book,person)
    @date = date
    @book = book
    @person = person
  end

  def get_book(book)
    @book = book
    book.add_rental(self)
  end

  def person_rent(person)
    @person = person
    person.rent_book(self)
  end
end
