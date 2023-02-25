class ApplicationController < ActionController::Base
  include ErrorHandling
  include Pagy::Backend

  add_flash_types :info, :danger, :success
end
