require_relative '../modules/trimmer'

describe TrimmerDecorator do
  describe 'correct_name' do
    it 'trims the name if it exceeds 10 characters' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('VeryLongName')
      decorator = TrimmerDecorator.new(nameable)

      expect(decorator.correct_name).to eq('VeryLongNa')
    end

    it 'does not trim the name if it is 10 characters or less' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('ShortName')
      decorator = TrimmerDecorator.new(nameable)

      expect(decorator.correct_name).to eq('ShortName')
    end
  end
end
