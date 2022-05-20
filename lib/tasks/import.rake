require 'uri'
require 'net/http'

task :import, [:books] => :environment do
  # Imports book from URI provided
  uri = URI('https://www.gutenberg.org/files/1400/1400-0.txt')
  response = Net::HTTP.get_response(uri)

  # Creates book record in DB with full contents
  book = Book.create!(contents: response.body)

  # Resets sequencing of IDs if rake command run multiple times
  ActiveRecord::Base.connection.reset_pk_sequence!('books')
end 

task destroy_all: :environment do
  Book.destroy_all
end

task all: [:destroy_all, :import]