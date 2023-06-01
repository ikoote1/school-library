require_relative '../modules/teacher'
require 'json'

describe Teacher do
  let(:age) { 30 }
  let(:name) { 'Jane Smith' }
  let(:specialization) { 'Mathematics' }
  let(:teacher) { Teacher.new(age, name, specialization) }

  describe '#initialize' do
    it 'creates a new teacher with the provided attributes' do
      expect(teacher.name).to eq(name)
      expect(teacher.age).to eq(age)
      expect(teacher.parent_permission).to be_truthy
      expect(teacher.rentals).to be_empty
    end
  end

  describe 'to_json' do
    it 'returns the teacher details as JSON' do
      expected_json = { id: teacher.id, name: name, age: age, parent_permission: true,
                        rentals: [], specialization: specialization }.to_json
      expect(teacher.to_json).to eq(expected_json)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for teacher' do
      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
