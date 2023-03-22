# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    @query = params[:q]
    @books = Book.search(@query)
    @authors = Author.search(@query)
  end
end
