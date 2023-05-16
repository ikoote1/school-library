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
	@nameable.correct_name
  end
end
