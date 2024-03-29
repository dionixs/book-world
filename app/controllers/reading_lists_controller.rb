# frozen_string_literal: true

class ReadingListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user!, except: %i[create update destroy]
  before_action :set_book!, except: %i[show]

  # TODO
  def show
    @reading_lists = @user.reading_lists.send(params[:type])
    @books = Book.where(id: @reading_lists.pluck(:book_id))
  end

  # TODO
  def create
    @reading_list = current_user.reading_lists.build(
      book: @book,
      reading_status: params[:reading_status].to_i
    )

    if @reading_list.save
      redirect_to @book, notice: 'Book was successfully added to reading list.'
    else
      redirect_to @book, alert: 'Failed to add book to reading list.'
    end
  end

  # TODO
  def update
    @reading_list = current_user.reading_lists.find_by(book_id: @book)
    if @reading_list.update(reading_status: params[:reading_status].to_i)
      redirect_to @book, notice: 'Book was successfully updated in your reading list.'
    else
      redirect_to @book, alert: 'Failed to update book in your reading list.'
    end
  end

  # TODO
  def destroy
    @reading_list = current_user.reading_lists.find_by(book_id: @book)
    @reading_list.destroy
    redirect_to book_url, notice: 'Book was successfully removed from your reading list.'
  end

  private

  # TODO
  def set_user!
    @user = User.find_by(username: params[:user_username])
  end

  def set_book!
    @book = Book.find(params[:book_id])
  end
end
