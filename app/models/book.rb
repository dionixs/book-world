# frozen_string_literal: true

class Book < ApplicationRecord
  include Authorable
  include Coverable

  attr_accessor :author_names

  after_commit :add_default_cover, on: %i[create]

  before_save :find_or_create_authors

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews, dependent: :destroy
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_one_attached :cover

  validates :title, presence: true, length: { minimum: 1, maximum: 70 }
  validates :author_names, length: { minimum: 3, maximum: 70 }
  validates :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }
  validates :description, length: { maximum: 3000 }

  validate :correct_cover_type
  validate :cover_size
end
