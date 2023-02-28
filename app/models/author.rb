# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  validates :name, presence: true, length: { minimum: 3, maximum: 70 }
end
