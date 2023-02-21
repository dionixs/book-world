class ApplicationController < ActionController::Base
  include ErrorHandling

  add_flash_types :info, :danger, :success
end
