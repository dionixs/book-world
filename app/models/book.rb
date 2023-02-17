# frozen_string_literal: true

class Book < ApplicationRecord
  include BookCoverValidatable

  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_one_attached :cover

  validates :title, presence: true
  validates :author, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }

  validate :correct_cover_type
  validate :cover_size
end
