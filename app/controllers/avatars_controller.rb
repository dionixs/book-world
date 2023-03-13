# frozen_string_literal: true

class AvatarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[update destroy]

  def update
    respond_to do |format|
      if @profile.update(avatar: profile_params[:avatar])
        format.html { redirect_to edit_profile_path, notice: t('.update.success') }
        format.json { render json: { success: true, message: t('.update.message') } }
      else
        format.html { redirect_to edit_profile_path, alert: t('.update.alert') }
        format.json { render json: { success: false, message: t('.update.alert') } }
      end
    end
  end

  def destroy
    @profile.avatar.purge
    respond_to do |format|
      format.html { redirect_to edit_profile_path, notice: t('.destroy.notice') }
      format.json { render json: { success: true, message: t('.destroy.message') } }
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:avatar)
  end

  def set_profile
    @profile = current_user&.profile
  end
end
