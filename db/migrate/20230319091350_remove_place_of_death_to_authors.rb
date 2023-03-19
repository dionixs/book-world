# frozen_string_literal: true

class RemovePlaceOfDeathToAuthors < ActiveRecord::Migration[7.0]
  def change
    remove_column :authors, :place_of_death, :string
  end
end
