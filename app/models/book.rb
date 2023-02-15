class Book < ApplicationRecord
  include BookDetails
  include Genres

  validates :title, presence: true
  validates :author, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }
end
