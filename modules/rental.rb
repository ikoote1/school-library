class Rental
    attr_accessor :date, :book

    def initialize(date)
        @date = date
        @book = nil
    end

    def get_book(book)
        @book = book
        book.add_rental(self)
    end
end