# frozen_string_literal: true

class CreateReadingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :reading_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :reading_status

      t.timestamps
    end
  end
end
