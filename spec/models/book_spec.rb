require 'rails_helper'

RSpec.describe Book, type: :model, :vcr do
  describe 'validations' do
    it { should validate_presence_of :contents }
    it { should validate_presence_of :word_pairs }
  end
end