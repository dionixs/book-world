# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[edit update]

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to edit_profile_path, notice: t('.update.notice')
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio)
  end

  def set_profile
    @profile = current_user&.profile
  end
end
