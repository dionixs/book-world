# frozen_string_literal: true

class Book < ApplicationRecord
  # include BookDetails
  include Coverable

  after_commit :add_default_cover, on: %i[create]

  has_many :reviews
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_one_attached :cover

  validates :title, presence: true, length: { minimum: 1, maximum: 70 },
                    uniqueness: { scope: :author, case_sensitive: true, on: %i[create update] }
  validates :author, presence: true, length: { minimum: 3, maximum: 50 },
                     uniqueness: { scope: :title, case_sensitive: true, on: %i[create update] }
  validates :description, length: { maximum: 600 }
  validates :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }

  validate :correct_cover_type
  validate :cover_size
end
