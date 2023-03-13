# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.date :date_of_birth
      t.string :country
      t.string :city
      t.string :facebook_url
      t.string :vk_url
      t.string :twitter_url
      t.string :instagram_url
      t.boolean :notifications_enabled, default: true

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
