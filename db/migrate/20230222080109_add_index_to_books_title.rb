# frozen_string_literal: true

class AddIndexToBooksTitle < ActiveRecord::Migration[7.0]
  def change
    add_index :books, :title
  end
end
