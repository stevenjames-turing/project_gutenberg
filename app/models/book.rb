class Book < ApplicationRecord
  validates_presence_of :contents, :word_pairs
end
