# frozen_string_literal: true

class User < ApplicationRecord
  include PasswordComplexityValidator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
end
