module BookDetails
  extend ActiveSupport::Concern

  included do

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
end