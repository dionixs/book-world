# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ErrorHandling
  include Pagy::Backend

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs << (:tos_agreement)
    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
