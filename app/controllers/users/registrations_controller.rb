# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :set_profile, only: %i[edit update]

    private

    def set_profile
      @profile = current_user&.profile
    end
  end
end
