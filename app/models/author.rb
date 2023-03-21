# frozen_string_literal: true

class Author < ApplicationRecord
  include AuthorImageable
  include AuthorQuery

  has_many :author_pseudonyms

  has_many :book_authors
  has_many :books, through: :book_authors

  has_one_attached :photo

  validates :short_name, presence: true, length: { minimum: 3, maximum: 70 }

  validate :correct_photo_type
  validate :photo_size

  # TODO
  def self.sorted_by_name
    order(:short_name)
  end
end
