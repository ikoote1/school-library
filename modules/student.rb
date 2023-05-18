require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super('Unknown', 0)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def join_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
