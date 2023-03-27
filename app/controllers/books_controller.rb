# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_book!, only: %i[show edit update archive destroy]
  before_action :set_reviews, only: %i[show]

  def index
    @books = Book.active.includes([:cover_attachment]).includes(:authors)
    @pagy, @books = pagy(@books, items: 30)
    @books = @books.decorate
    @genres = Genre.where(parent_id: nil)

    respond_to do |format|
      format.html
      format.json { render :index }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :show }
    end
  end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: t('.create') }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: t('.update') }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO
  def archive
    @book.update(status: 'archived')
    redirect_to books_url, notice: 'Successfully Archived'
  end

  def destroy
    @book.book_authors.destroy_all
    @book.destroy
    redirect_to books_url, notice: t('.destroy')
  end

  private

  def set_book!
    @book = Book.find(params[:id])
  end

  def set_reviews
    @reviews = @book.reviews.order created_at: :desc
    @pagy, @reviews = pagy(@reviews, items: 3)
    @reviews = @reviews.decorate
  end

  def book_params
    params.require(:book).permit(:title, :description, :rating, :cover,
                                 :author_names, genre_ids: [])
  end
end
