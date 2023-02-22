# frozen_string_literal: true

class AddUniqueIndexToGenresNameEnRu < ActiveRecord::Migration[7.0]
  def up
    add_index :genres, %i[name_en name_ru], unique: true, name: 'unique_index_on_name_en_ru'
  end

  def down
    remove_index :genres, name: 'unique_index_on_name_en_ru'
  end
end
