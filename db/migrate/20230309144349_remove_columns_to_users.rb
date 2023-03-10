# frozen_string_literal: true

class RemoveColumnsToUsers < ActiveRecord::Migration[7.0]
  def up
    remove_columns(:users, :first_name, :last_name, :full_name, type: :string)
  end

  def down
    change_table :users, bulk: true do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :full_name, :string
    end
  end
end
