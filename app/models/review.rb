# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :book

  validates :body, presence: true, length: { minimum: 10, maximum: 3000 }
end
