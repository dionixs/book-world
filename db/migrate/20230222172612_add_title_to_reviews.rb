# frozen_string_literal: true

class AddTitleToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :title, :string
  end
end
