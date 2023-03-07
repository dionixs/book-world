# frozen_string_literal: true

class Book < ApplicationRecord
  include Authorable
  include BookDetails
  include Coverable

  attr_writer :author

  after_commit :add_default_cover, on: %i[create]

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many :reviews, dependent: :destroy
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_one_attached :cover

  validates :title, presence: true, allow_blank: false, length: { minimum: 1, maximum: 70 }
  validates :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }
  validates :description, length: { maximum: 3000 }

  validate :correct_cover_type
  validate :cover_size
end
