# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 50 }
end
