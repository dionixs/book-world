module Genres
  extend ActiveSupport::Concern

  included do
    before_save :normalize_genre

    GENRES = [
      'Fantasy',
      'Science Fiction',
      'Mystery',
      'Romance',
      'Horror'
    ]

    def self.genres
      GENRES
    end
  end

  def normalize_genre
    self.genre = self.genre.downcase
  end
end