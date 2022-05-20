class Book < ApplicationRecord
  before_validation :set_word_pairs

  serialize :word_pairs

  def set_word_pairs
    book_text = contents.downcase.gsub(/[^0-9a-z' ]/, '')
    book_array = book_text.split(' ')
    book_pairs = []
    book_array.each_cons(2) do |pair|
      book_pairs << pair 
    end
    self.word_pairs = book_pairs
  end
end
