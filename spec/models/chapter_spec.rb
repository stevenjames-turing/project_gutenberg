require 'rails_helper'

RSpec.describe Chapter, type: :model do
  describe 'chapter creation', :vcr do 
    it 'sets word pairs using full chapter contents' do 
      uri = URI('https://www.gutenberg.org/files/1400/1400-0.txt')
      response = Net::HTTP.get_response(uri)

      book = Book.create!(contents: response.body)

      book.chapters.each do |chapter|
        expect(chapter.word_pairs).to_not be nil 
      end
    end
  end
end
