# frozen_string_literal: true

class User < ApplicationRecord
  include PasswordComplexityValidator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { minimum: 3, maximum: 25 },
                       uniqueness: { case_sensitive: false,
                                     message: 'An account associated with %<value>s already exists' },
                       exclusion: { in: %w[admin root superuser] }
  validates_format_of :username, with: /\A[a-zA-Z0-9_]+\z/i
  validate :password_complexity
end
