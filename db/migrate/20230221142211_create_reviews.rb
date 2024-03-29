# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.belongs_to :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
