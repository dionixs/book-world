# frozen_string_literal: true

class AddMissingNullChecks < ActiveRecord::Migration[7.0]

  def change
    change_column_null :books, :title, false
    change_column_null :authors, :name, false
    change_column_null :reviews, :title, false
  end
end
