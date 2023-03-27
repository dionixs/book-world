# frozen_string_literal: true

class AddStatusToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :status, :string, default: 'active', null: false
  end
end
