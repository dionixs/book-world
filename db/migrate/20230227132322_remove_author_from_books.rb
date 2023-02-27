# frozen_string_literal: true

class RemoveAuthorFromBooks < ActiveRecord::Migration[7.0]

  def up
    if Book.any?
      Book.all.each do |book|
        author = Author.find_or_create_by(name: book.author)
        BookAuthor.create(book:, author:)
      end
    end

    remove_column :books, :author
  end

  def down
    add_column :books, :author, :string

    if BookAuthor.any?
      BookAuthor.all.each do |book_author|
        book = book_author.book
        author = book_author.author
        book.update(author: author.name)
      end
    end

    BookAuthor.delete_all
  end
end
