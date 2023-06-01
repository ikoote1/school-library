require_relative '../modules/person'
require_relative '../modules/book'
require_relative '../modules/rental'
require 'json'

describe Person do
  let(:age) { 25 }
  let(:parent_permission) { true }
  let(:name) { 'Usman' }
  let(:person) { Person.new(age, parent_permission, name) }

  describe 'correct_name' do

    it 'should have attributes age, name, parent_permissions' do
      expect(person).to have_attributes(age: 25)
      expect(person).to have_attributes(name: 'Usman')
      expect(person).to have_attributes(parent_permission: true)
    end

    it 'returns the name' do
      expect(person.correct_name).to eq('Usman')
    end
  end

  # let(:book) { Book.new("Bible", "God") }
  # let(:date) { "01/06/2023" }

  # describe 'rent_book' do
  #   it 'Return rental for the book' do
  #     expected_rental = Rental.new(book, date, person)
  #     expect(person.rent_book(book, date)).to eq(expected_rental)
  #   end
  # end

  describe 'can_use_services' do
    it 'returns true if the person can use services' do
      expect(person.can_use_services?).to equal(true)
    end
  end
end
