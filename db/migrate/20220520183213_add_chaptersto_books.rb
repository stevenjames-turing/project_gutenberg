class AddChapterstoBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :chapters, :book, foreign_key: true
  end
end
