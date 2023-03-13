# frozen_string_literal: true

class AdminUser < ApplicationRecord
  include Authenticatable

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
