# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :genre
      t.integer :rating
      t.string :cover

      t.timestamps
    end
  end
end
