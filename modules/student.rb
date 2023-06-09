require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permission, name, classroom: 'Unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def to_json(*args)
    { id: id, name: name, age: age, parent_permission: parent_permission, rentals: [],
      classroom: classroom }.to_json(*args)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def join_classroom
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
