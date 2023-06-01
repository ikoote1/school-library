require_relative '../modules/student'
require_relative '../modules/classroom'
require 'json'

describe Student do
  let(:age) { 25 }
  let(:parent_permission) { true }
  let(:name) { 'Usman' }
  let(:classroom) { 'Unkown' }
  let(:id) { 150 }
  let(:student) { Student.new(age, parent_permission, name, classroom: classroom) }

  describe '#to_json' do
    it 'returns the student details as JSON' do
      expected_json = student.to_json
      expect(student.to_json).to eq(expected_json)
    end
  end

  describe 'Play Hockey' do
    it 'returns the string of expression' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe 'join_classroom=' do
    it 'assigns the classroom and adds the student to the classroom' do
      new_classroom = Classroom.new('Class B')
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
    end
  end
end
