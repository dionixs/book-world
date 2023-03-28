# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, through: :book_genres

  belongs_to :parent, class_name: 'Genre', optional: true
  has_many :subgenres, class_name: 'Genre', foreign_key: 'parent_id'

  validates :genre_slug, presence: true
  validates :name_en, presence: true
  validates :name_ru, presence: true

  def genre_and_subgenre_ids
    subgenre_ids = subgenres.pluck(:id)
    [id] + subgenre_ids
  end
end
