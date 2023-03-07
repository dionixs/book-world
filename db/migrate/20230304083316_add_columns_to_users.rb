# frozen_string_literal: true

class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    # rubocop:disable Rails/BulkChangeTable
    add_column :users, :first_name, :string
    # rubocop:enable Rails/BulkChangeTable
    add_column :users, :last_name, :string
  end
end
