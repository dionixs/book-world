# frozen_string_literal: true

class Author < ApplicationRecord
  include PgSearch::Model
  include AuthorImageable
  include AuthorQuery
  include Statusable

  has_many :author_pseudonyms

  has_many :book_authors
  has_many :books, through: :book_authors

  has_one_attached :photo

  validates :short_name, presence: true, length: { minimum: 3, maximum: 70 }

  validate :correct_photo_type
  validate :photo_size

  pg_search_scope :search,
                  against: %i[short_name full_name],
                  associated_against: { books: [:title] },
                  using: { tsearch: { prefix: true } }

  # TODO
  def self.sorted_by_name
    order(:short_name)
  end

  # todo
  def genres
    Genre.joins(books: :book_authors)
         .where(book_authors: { author_id: id })
         .distinct
  end

  # todo
  def genres_names_with_ids
    genres.pluck("name_#{I18n.locale}".to_sym, :id)
  end
end
