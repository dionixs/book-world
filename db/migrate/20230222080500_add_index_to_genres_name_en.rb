# frozen_string_literal: true

class AddIndexToGenresNameEn < ActiveRecord::Migration[7.0]
  def change
    add_index :genres, :name_en
  end
end
