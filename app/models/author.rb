# frozen_string_literal: true

class Author < ApplicationRecord
  include AuthorImageable

  has_many :book_authors
  has_many :books, through: :book_authors

  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 3, maximum: 70 }

  validate :correct_photo_type
  validate :photo_size
end
