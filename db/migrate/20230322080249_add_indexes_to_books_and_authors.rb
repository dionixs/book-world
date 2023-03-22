# frozen_string_literal: true

class AddIndexesToBooksAndAuthors < ActiveRecord::Migration[7.0]

  def change
    add_index :books, :description
    add_index :authors, :full_author_name
    add_index :authors, :short_name
  end
end
