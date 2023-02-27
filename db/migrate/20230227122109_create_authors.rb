# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.date :birth_date
      t.date :death_date
      t.string :place_of_birth
      t.string :place_of_death

      t.timestamps
    end
  end
end
