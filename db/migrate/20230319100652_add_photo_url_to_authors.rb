# frozen_string_literal: true

class AddPhotoUrlToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :photo_url, :string
  end
end
