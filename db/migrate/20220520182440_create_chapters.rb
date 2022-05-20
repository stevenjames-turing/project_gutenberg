class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.text :contents
      t.text :word_pairs

      t.timestamps
    end
  end
end
