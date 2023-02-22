# frozen_string_literal: true

class AddIndexToReviewsCreatedAt < ActiveRecord::Migration[7.0]
  def change
    add_index :reviews, :created_at
  end
end
