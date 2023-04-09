# frozen_string_literal: true

class User < ApplicationRecord
  include Authenticatable
  include PasswordComplexityValidator
  # include Accessible
  include UserDetails
  # include ProfileDetails
  include Avatarable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_many :reading_lists

  after_create :create_profile
  after_update :update_gravatar_hash

  validates :username,
            length: { minimum: 3, maximum: 25 },
            uniqueness: { case_sensitive: false,
                          message: :taken_username_message },
            exclusion: { in: %w[admin root superuser] }

  validates :username, format: { with: /^[a-zA-Z0-9_.]*$/, multiline: true }
  validate :validate_username

  validate :password_complexity

  validates :tos_agreement, acceptance: { allow_nil: false, on: :create }

  # TODO
  def user_book_status(book)
    reading_list = reading_lists.find { |r| r.user_id == id && r.book_id == book.id }
    status = reading_list&.reading_status
    ReadingList.reading_statuses[status]
  end

end
