# frozen_string_literal: true

class AddIndexToSearchableBooks < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index :books, :searchable, using: :gin, algorithm: :concurrently
  end
end
