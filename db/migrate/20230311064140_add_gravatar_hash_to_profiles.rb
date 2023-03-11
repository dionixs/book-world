# frozen_string_literal: true

class AddGravatarHashToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :gravatar_hash, :string
  end
end
