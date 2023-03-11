# frozen_string_literal: true

class Profile < ApplicationRecord
  # include ProfileDetails
  include Avatarable

  belongs_to :user

  after_create :set_gravatar_hash

  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 50 }
end
