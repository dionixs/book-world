# frozen_string_literal: true

class Review < ApplicationRecord
  include ReviewDetails

  attr_accessor :body

  belongs_to :book

  has_rich_text :body

  validates :title, presence: true, length: { minimum: 1, maximum: 70 }
  validate :body_length
end
