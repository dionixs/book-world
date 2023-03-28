# frozen_string_literal: true

class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @genre_ids = @genre.genre_and_subgenre_ids

    @books = cache('index_books', expires_in: 1.day) do
      Book.active.with_cover_and_authors.books_for_genre_and_subgenres(@genre_ids)
    end

    @pagy, @books = pagy(@books, items: 30)
    @books = @books.decorate

    @genres = cache('index_genres', expires_in: 1.day) do
      Genre.where(parent_id: nil)
    end
  end
end
