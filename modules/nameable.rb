class Nameable
  def correct_name
	raise NotImplementedError, "Method need some implementations"  
  end
end

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
	@nameable = nameable
  end

  def correct_name
	@nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
	@nameable.correct_name.capitalize
  end
end
class TrimmerDecorator < BaseDecorator
  def correct_name
    trimmed_name = @nameable.correct_name[0..9]
    trimmed_name.length < @nameable.correct_name.length ? trimmed_name : @nameable.correct_name
  end
end
