# frozen_string_literal: true

class AddStatusToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :status, :string, default: 'active', null: false
  end
end
