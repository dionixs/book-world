# frozen_string_literal: true

class AddGenreSlugToGenres < ActiveRecord::Migration[7.0]
  def up
    add_column :genres, :genre_slug, :string

    if Genre.any?
      Genre.all.each do |genre|
        genre.update(genre_slug: genre.name_en.downcase.gsub(/\s/, '-').gsub(/&|[()]|,/, ''))
      end
    end

    add_index :genres, :genre_slug, unique: true
  end

  def down
    remove_column :genres, :genre_slug
  end
end
