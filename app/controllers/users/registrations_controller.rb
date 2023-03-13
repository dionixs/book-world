# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :set_profile, only: %i[edit update]
    # rubocop:enable Rails/LexicallyScopedActionFilter

    private

    def set_profile
      @profile = current_user&.profile
    end
  end
end
