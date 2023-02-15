# frozen_string_literal: true

class AddParentIdToGenres < ActiveRecord::Migration[7.0]
  def change
    add_column :genres, :parent_id, :integer
  end
end
