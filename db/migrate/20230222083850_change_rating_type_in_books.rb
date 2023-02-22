# frozen_string_literal: true

class ChangeRatingTypeInBooks < ActiveRecord::Migration[7.0]
  def up
    add_column :books, :new_rating, :decimal, precision: 3, scale: 2, default: 0.0

    if Book.any?
      Book.all.each do |book|
        book.update_column(:new_rating, book.rating)
      end
    end

    remove_column :books, :rating
    rename_column :books, :new_rating, :rating
  end

  def down
    add_column :books, :new_rating, :float, default: 0.0

    if Book.any?
      Book.all.each do |book|
        book.update_column(:new_rating, book.rating)
      end
    end

    remove_column :books, :rating
    rename_column :books, :new_rating, :rating
  end
end
