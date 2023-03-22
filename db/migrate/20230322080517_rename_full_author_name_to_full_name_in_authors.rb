# frozen_string_literal: true

class RenameFullAuthorNameToFullNameInAuthors < ActiveRecord::Migration[7.0]
  def change
    rename_column :authors, :full_author_name, :full_name
  end
end
