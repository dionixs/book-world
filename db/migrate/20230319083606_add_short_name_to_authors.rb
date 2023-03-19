# frozen_string_literal: true

class AddShortNameToAuthors < ActiveRecord::Migration[7.0]
  def up
    add_column :authors, :short_name, :string

    if Author.any?
      Author.all.each do |author|
        author.update(short_name: author.name)
      end
    end

    remove_column :authors, :name
  end

  def down
    add_column :authors, :name, :string

    if Author.any?
      Author.all.each do |author|
        author.update(name: author.short_name)
      end
    end

    remove_column :authors, :short_name
  end
end
