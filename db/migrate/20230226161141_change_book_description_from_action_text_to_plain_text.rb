# frozen_string_literal: true

class ChangeBookDescriptionFromActionTextToPlainText < ActiveRecord::Migration[7.0]
  include ActionView::Helpers::TextHelper

  def up
    add_column :books, :old_description, :text

    if Book.any?
      Book.all.each do |book|
        # rubocop:disable Rails/SkipsModelValidations
        book.update_attribute(:old_description, book.description.to_plain_text)
        # rubocop:enable Rails/SkipsModelValidations
        book.description.delete
      end
    end

    rename_column :books, :old_description, :description
  end

  def down
    rename_column :books, :description, :old_description

    if Book.any?
      Book.all.each do |book|
        # rubocop:disable Rails/SkipsModelValidations
        book.update_attribute(:description, simple_format(book.old_description))
        # rubocop:enable Rails/SkipsModelValidations
      end
    end

    remove_column :books, :old_description
  end
end
