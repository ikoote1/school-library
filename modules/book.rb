class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_json(*args)
    { title: title, author: author, rentals: [] }.to_json(*args)
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
