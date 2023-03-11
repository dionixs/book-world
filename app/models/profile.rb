# frozen_string_literal: true

class Profile < ApplicationRecord
  # include ProfileDetails
  include Avatarable

  belongs_to :user

  after_create :set_gravatar_hash

  has_one_attached :avatar

  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 50 }

  validate :correct_avatar_type
  validate :avatar_size
end
