# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_genres
  has_many :genres, through: :book_genres

  include BookDetails

  validates :title, presence: true
  validates :author, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }
end

