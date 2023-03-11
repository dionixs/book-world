# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ErrorHandling
  include Pagy::Backend
  include Internationalization

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me
                     tos_agreement first_name last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
