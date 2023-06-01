require_relative '../modules/classroom'

describe Classroom do
  let(:label) { 'Mathematics' }
  let(:classroom) { Classroom.new(label) }

  describe 'add_student' do
    let(:student) { double('Student') }

    it 'adds a student to the classroom' do
      expect(classroom.students).to be_empty
      expect(student).to receive(:classroom=).with(classroom)

      classroom.add_student(student)

      expect(classroom.students).to contain_exactly(student)
    end
  end
end
