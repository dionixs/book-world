# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :book

  validates :title, presence: true, length: { minimum: 1, maximum: 70 }
  validates :body, presence: true, length: { minimum: 10, maximum: 3000 }
end
