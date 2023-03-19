# frozen_string_literal: true

class RenameAuthorAliasToAuthorPseudonym < ActiveRecord::Migration[7.0]
  def change
    rename_table :author_aliases, :author_pseudonyms
  end
end
