# frozen_string_literal: true

class AddSeoDescriptionToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :seo_description, :string
  end
end
