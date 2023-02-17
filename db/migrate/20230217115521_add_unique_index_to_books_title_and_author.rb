# frozen_string_literal: true

class AddUniqueIndexToBooksTitleAndAuthor < ActiveRecord::Migration[7.0]
  def up
    add_index :books, %i[title author], unique: true, name: 'index_books_on_title_and_author_unique'
  end

  def down
    remove_index :books, name: 'index_books_on_title_and_author_unique'
  end
end
