# frozen_string_literal: true

class Book < ApplicationRecord
  include PgSearch::Model
  include Authorable
  include BookDetails
  include Coverable
  include Statusable

  attr_writer :author

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many :reviews, dependent: :destroy
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_one_attached :cover

  validates :title, presence: true, allow_blank: false, length: { minimum: 3, maximum: 70 }
  validates :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }
  validates :description, length: { maximum: 3000 }

  validate :correct_cover_type
  validate :cover_size

  scope :active, -> { where(status: 'active') }
  scope :with_cover_and_authors, -> { includes(:cover_attachment, :authors) }

  pg_search_scope :search,
                  against: { title: 'A', description: 'B' },
                  associated_against: { authors: %i[full_name short_name] },
                  using: { tsearch: {
                    dictionary: 'russian',
                    tsvector_column: 'searchable',
                    prefix: true
                  } }

  def self.books_for_genre_and_subgenres(genre_ids)
    book_ids = BookGenre.where(genre_id: genre_ids).pluck(:book_id).uniq
    where(id: book_ids)
  end
end
