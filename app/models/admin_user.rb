# frozen_string_literal: true

class AdminUser < ApplicationRecord
  include Authenticatable

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

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
