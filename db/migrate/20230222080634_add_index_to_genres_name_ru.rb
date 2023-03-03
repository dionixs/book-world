# frozen_string_literal: true

class AddIndexToGenresNameRu < ActiveRecord::Migration[7.0]
  def change
    add_index :genres, :name_ru
  end
end
