class Api::V1::BooksController < ApplicationController

  def index
    # Checks to ensure param is not missing or empty string
    if params[:word_pair].blank?
      json_response({ "error": {"message" => 'invalid parameters'} }, :bad_request)
    else
      book = Book.last
      json_response(BookSerializer.pairing_total_count(params[:word_pair], book.word_pairing_count(params[:word_pair])))
    end
  end
end 