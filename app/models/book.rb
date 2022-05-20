class Book < ApplicationRecord
  before_validation :set_word_pairs

  serialize :word_pairs

  def set_word_pairs
    # Remove new lines
    single_line = contents.gsub(/\R+/, ' ')

    # Standardize text
    book_text = single_line.downcase.gsub(/[^0-9a-z' ]/, '')
    book_array = book_text.split(' ')

    # Set pairs and save to record
    book_pairs = []
    book_array.each_cons(2) do |pair|
      book_pairs << pair 
    end
    self.word_pairs = book_pairs
  end
end
