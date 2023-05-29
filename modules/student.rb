require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permission, name, classroom: 'Unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def join_classroom
    @classroom = classroom
    classroom.student.push(self) unless classroom.students.include?(self)
  end
end
