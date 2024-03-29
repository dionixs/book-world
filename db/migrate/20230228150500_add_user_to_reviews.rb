# frozen_string_literal: true

class AddUserToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :user, null: false, default: '', foreign_key: true
  end
end
