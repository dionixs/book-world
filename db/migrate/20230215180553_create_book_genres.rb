# frozen_string_literal: true

class CreateBookGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :book_genres do |t|
      t.references :book, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
