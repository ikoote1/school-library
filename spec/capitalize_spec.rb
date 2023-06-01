require_relative '../modules/capitalize'

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the name' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('mukisa')
      decorator = CapitalizeDecorator.new(nameable)

      expect(decorator.correct_name).to eq('Mukisa')
    end
  end
end
