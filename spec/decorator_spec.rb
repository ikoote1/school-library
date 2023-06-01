require_relative '../modules/decorator'

describe BaseDecorator do
  describe '#correct_name' do
    it 'delegates to the nameable object' do
      nameable = double('Nameable')
      decorator = BaseDecorator.new(nameable)

      expect(nameable).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
