require './person'

class Student < Person
  def initialize(classroom)
    super('Unknown', 0)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
