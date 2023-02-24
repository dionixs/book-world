# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_book!, only: %i[index new show create edit update destroy]
  before_action :set_review!, except: %i[index new create]
  before_action :build_review, only: %i[create]
  before_action :set_reviews, only: %i[index create]

  def index; end

  def new
    @review = @book.reviews.build
  end

  def show; end

  def create
    respond_to do |format|
      if @review.save
        format.html { redirect_to @book, success: 'Review was successfully created.' }
        format.json { render json: @review, status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @book, success: 'Review was successfully updated.' }
        format.json { render json: @review, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    review = @book.reviews.find(params[:id])
    review.destroy
    redirect_to book_path(@book), success: 'Review was successfully destroyed.'
  end

  private

  def review_params
    params.require(:review).permit(:title, :body)
  end

  def set_book!
    @book = Book.find(params[:book_id])
  end

  def set_review!
    @review = Review.find(params[:id])
  end

  def build_review
    @review = @book.reviews.build(review_params)
  end

  def set_reviews
    @reviews = @book.reviews.order created_at: :desc
  end
end
