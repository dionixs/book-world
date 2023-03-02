# frozen_string_literal: true

module Authenticatable
  extend ActiveSupport::Concern

  included do
    attr_writer :login

    def login
      @login || username || email
    end

    def validate_username
      return unless User.where(email: username).exists?

      errors.add(:username, :invalid)
    end
  end
end
