class Book < ApplicationRecord
  before_validation :set_word_pairs, on: :create
  after_create :create_chapters
  serialize :word_pairs
  
  has_many :chapters

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

def create_chapters 
    chapter_contents = contents.split(/\r\n\r\n\r\n\r\n\r\nChapter/)

    # Ignore contents before first chapter
    chapter_contents[1..-1].each do |chapter_content|
      Chapter.create!(contents: chapter_content, book_id: id)
    end
  end
