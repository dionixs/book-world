# frozen_string_literal: true

class AddFullAuthorNameToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :full_author_name, :string
  end
end
