# frozen_string_literal: true

module UserDetails
  extend ActiveSupport::Concern

  included do
    private

    def create_profile
      Profile.create(user: self)
    end
  end
end
