# frozen_string_literal: true

class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @pagy, @books = pagy(@genre.books, items: 30)
    @books = @books.decorate
    @genres = Genre.where(parent_id: nil)
  end
end