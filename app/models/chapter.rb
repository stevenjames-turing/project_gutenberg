class Chapter < ApplicationRecord

  before_validation :set_word_pairs, on: :create
  serialize :word_pairs

  belongs_to :book

end
