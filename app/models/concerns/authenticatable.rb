# frozen_string_literal: true

module Authenticatable
  extend ActiveSupport::Concern

  included do
    attr_writer :login

    def login
      @login || username || email
    end

    def validate_username
      return unless User.exists?(email: username)

      errors.add(:username, :invalid)
    end

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
end
