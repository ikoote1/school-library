require_relative '../modules/book'
require 'json'

describe Book do
  let(:title) { 'The Gat' }
  let(:author) { 'F. Fitzgerald' }
  let(:book) { Book.new(title, author) }

  describe 'to_json' do
    it 'returns the book details as JSON' do
      expected_json = { title:, author:, rentals: [] }.to_json
      expect(book.to_json).to eq(expected_json)
    end
  end

  describe 'initialize' do
    it 'sets the title and author' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end

    it 'initializes an empty rentals array' do
      expect(book.rentals).to eq([])
    end
  end
end
