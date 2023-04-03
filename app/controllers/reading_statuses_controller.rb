# frozen_string_literal: true

class ReadingStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book!

  private

  def set_book!
    @book = Book.find(params[:id])
  end
end
