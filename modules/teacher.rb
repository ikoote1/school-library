require './person'

class Teacher < Person
  def initialize(age, name, specialization)
    super(age, true, name)
    @specialization = specialization
  end

  def to_json(*args)
    { id: id, name: name, age: age, parent_permission: parent_permission, rentals: [],
      specialization: @specialization }.to_json(*args)
  end

  def can_use_services?
    true
  end
end
