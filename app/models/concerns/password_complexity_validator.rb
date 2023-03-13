# frozen_string_literal: true

module PasswordComplexityValidator
  extend ActiveSupport::Concern

  included do
    private

    def password_complexity
      # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
      if password.blank? || password.length < 6 || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/
        return
      end

      errors.add :password, I18n.t('.errors.messages.password_complexity')
    end
  end
end
