# frozen_string_literal: true

class ReviewsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_book!, only: %i[index new show create edit update destroy]
  before_action :set_review!, except: %i[index new create]
  before_action :build_review, only: %i[create]
  before_action :set_reviews, only: %i[index create]
  before_action :check_user_reviewed_book, only: %i[new create]

  def index
    @pagy, @reviews = pagy(@reviews, items: 10)
    @reviews = @reviews.decorate
  end

  def show
    @review = Review.find(params[:id]).decorate
  end

  def new
    @review = @book.reviews.build
  end

  def edit; end

  # rubocop:disable Metrics/MethodLength
  def create
    respond_to do |format|
      if @review.save
        format.html do
          flash[:notice] = t('.create')
          redirect_to book_path(@book, anchor: dom_id(@review))
        end
        format.json { render json: review_as_json(@review), status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html do
          redirect_to book_path(@book, anchor: dom_id(@review)), notice: t('.update')
        end
        format.json { render json: review_as_json(@review), status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # rubocop:enable Metrics/MethodLength

  def destroy
    review = @book.reviews.find(params[:id])
    review.destroy
    redirect_to book_path(@book), notice: t('.destroy')
  end

  private

  def review_params
    params.require(:review).permit(:title, :body)
  end

  def review_as_json(review)
    review_json = review.as_json
    review_json['body'] = review.body.to_plain_text
    review_json
  end

  def set_book!
    @book = Book.find(params[:book_id])
  end

  def set_review!
    @review = Review.find(params[:id])
  end

  def build_review
    @review = @book.reviews.build(review_params)
    @review.user_id = current_user.id
  end

  def set_reviews
    @reviews = @book.reviews.order created_at: :desc
  end

  def check_user_reviewed_book
    return unless @book.reviewed_by_user?(current_user)

    redirect_to @book, alert: t('.check_user_reviewed_book')
  end
end
