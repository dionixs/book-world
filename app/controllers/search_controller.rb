# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    @query = params[:search]

    @books = Book.active.search(@query).includes([:cover_attachment]).includes([:authors]).limit(100)
    @book_count = @books.count
    @books = @books.decorate

    @authors = Author.active.search(@query).includes([:photo_attachment]).limit(6)
    @author_count = @authors.count
  end
end
