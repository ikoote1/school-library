require_relative '../modules/person'
require_relative '../modules/book'
require_relative '../modules/rental'
require 'json'

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

  describe 'can_use_services' do
    it 'returns true if the person can use services' do
      expect(person.can_use_services?).to equal(true)
    end
  end

end