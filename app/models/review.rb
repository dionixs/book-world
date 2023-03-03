# frozen_string_literal: true

class Review < ApplicationRecord
  include ReviewDetails

  attr_accessor :body

  belongs_to :user
  belongs_to :book

  has_rich_text :body

  validates :title, presence: true, length: { minimum: 1, maximum: 70 }
  validates :body, presence: true
  validate :body_length
  validate :user_can_only_review_book_once, on: :create
end
