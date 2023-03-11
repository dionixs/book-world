# frozen_string_literal: true

class AvatarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[update destroy]

  def update
    respond_to do |format|
      if @profile.update(avatar: profile_params[:avatar])
        format.html { redirect_to edit_profile_path, notice: 'Avatar was successfully uploaded.' }
        format.json { render json: { success: true, message: 'Avatar was successfully uploaded.' } }
      else
        format.html { redirect_to edit_profile_path, alert: 'Файл поврежден или не является изображением!' }
        format.json { render json: { success: false, message: 'Файл поврежден или не является изображением!' } }
      end
    end
  end

  def destroy
    @profile.avatar.purge
    respond_to do |format|
      format.html { redirect_to edit_profile_path, notice: 'Avatar was successfully removed.' }
      format.json { render json: { success: true, message: 'Avatar was successfully removed.' } }
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
