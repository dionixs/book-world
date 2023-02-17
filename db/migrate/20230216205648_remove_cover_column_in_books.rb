# frozen_string_literal: true

class RemoveCoverColumnInBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :cover, :string
  end
end
