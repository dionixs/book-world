# frozen_string_literal: true

class CreateAuthorAliases < ActiveRecord::Migration[7.0]
  def change
    create_table :author_aliases do |t|
      t.string :name

      t.belongs_to :author, index: true, foreign_key: true
      t.timestamps
    end
  end
end
