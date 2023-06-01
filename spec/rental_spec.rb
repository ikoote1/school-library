require_relative '../modules/rental'
require 'json'

describe Rental do
  let(:date) { '2021-09-20' }
  let(:book) { double('Book', rentals: []) }
  let(:person) { double('Person', rentals: []) }
  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'assigns the date, book, and person' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book and person' do
      expect(book.rentals).to contain_exactly(rental)
      expect(person.rentals).to contain_exactly(rental)
    end
  end

  describe '#to_json' do
    it 'returns the rental details as JSON' do
      expected_json = { date:, book:, person: }.to_json
      expect(rental.to_json).to eq(expected_json)
    end
  end
end
