require_relative './decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    trimmed_name = @nameable.correct_name[0..9]
    trimmed_name.length < @nameable.correct_name.length ? trimmed_name : @nameable.correct_name
  end
end
