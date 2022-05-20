class Book < ApplicationRecord

  before_validation :set_word_pairs, on: :create
  after_create :create_chapters
  serialize :word_pairs
  
  has_many :chapters
  
  def create_chapters 
    chapter_contents = contents.split(/\r\n\r\n\r\n\r\n\r\nChapter/)
    
    # Ignore contents before first chapter
    chapter_contents[1..-1].each do |chapter_content|
      Chapter.create!(contents: chapter_content, book_id: id)
    end
  end
end
