require 'rails_helper'

RSpec.describe Book, type: :model do
  
  # describe 'validations' do
  #   it { should validate_presence_of :contents }
  #   it { should validate_presence_of :word_pairs }
  # end

  describe 'book creation', :vcr do 
    it 'sets word pairs using full book contents' do 
      uri = URI('https://www.gutenberg.org/files/1400/1400-0.txt')
      response = Net::HTTP.get_response(uri)

      book = Book.create!(contents: response.body)

      expect(book.word_pairs).to_not be nil 
      expect(book.word_pairs).to be_a Hash

      book.word_pairs.each do |pair|
        expect(pair.count).to eq(2)
      end
    end

    it 'creates multiple chapters from book contents' do 
      uri = URI('https://www.gutenberg.org/files/1400/1400-0.txt')
      response = Net::HTTP.get_response(uri)

      book = Book.create!(contents: response.body)

      expect(book.chapters.count).to eq(59)
    end
  end
end