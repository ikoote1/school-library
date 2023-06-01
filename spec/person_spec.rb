require_relative '../modules/person'
require_relative '../modules/book'
require_relative '../modules/rental'
require 'json'
require 'date'

describe Person do
  let(:age) { 25 }
  let(:parent_permission) { 'Y' }
  let(:name) { 'Usman' }
  let(:person) { Person.new(age, parent_permission, name) }

  describe 'correct_name' do
    it 'returns the name' do
      expect(person.correct_name).to eq('Usman')
    end
  end

  describe 'can_use_services?' do
    it 'returns true if the person can use services' do
      expect(person.can_use_services?).to equal(true)
    end
  end

  describe 'attributes' do
    it 'has a name' do
      expect(person.name).to eq('Usman')
    end

    it 'has an age' do
      expect(person.age).to eq(25)
    end

    it 'has a parent permission' do
      expect(person.parent_permission).to eq('Y')
    end

    it 'has rentals' do
      expect(person.rentals).to be_an(Array)
      expect(person.rentals).to be_empty
    end
  end

  describe 'rent_book' do
    let(:book) { Book.new('Book Title', 'Author') }
    let(:date) { Date.today }

    it 'creates a new rental' do
      rental = person.rent_book(book, date)
      expect(rental).to be_a(Rental)
      expect(rental.book).to eq(book)
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the person' do
      person.rent_book(book, date)
      expect(person.rentals.size).to eq(1)
      expect(person.rentals.first.book).to eq(book)
      expect(person.rentals.first.date).to eq(date)
      expect(person.rentals.first.person).to eq(person)
    end
  end
end
