# frozen_string_literal: true

class User < ApplicationRecord
  include Authenticatable
  include PasswordComplexityValidator
  # include Accessible
  include UserDetails

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  after_create :create_profile

  validates :username, presence: true, length: { minimum: 3, maximum: 25 },
            uniqueness: { case_sensitive: false,
                          message: 'An account associated with %<value>s already exists' },
            exclusion: { in: %w[admin root superuser] }
  validates :username, format: { with: /^[a-zA-Z0-9_.]*$/, multiline: true }

  validate :validate_username
  validate :password_complexity

  validates :tos_agreement, acceptance: { allow_nil: false, on: :create }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions[:username].nil?
      where(conditions).first
    else
      where(username: conditions[:username]).first
    end
  end
end
