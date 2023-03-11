# frozen_string_literal: true

module Avatarable

  extend ActiveSupport::Concern

  include AttachableImage
  include ImageValidatable

  included do

    private

    def set_gravatar_hash
      return if user.email.blank?

      hash = Digest::MD5.hexdigest user.email.strip.downcase
      self.gravatar_hash = hash
      save
    end

    def update_gravatar_hash
      profile.send(:set_gravatar_hash) if saved_change_to_email?
    end

    def correct_avatar_type
      correct_image_type(:avatar)
    end

    def avatar_size
      image_size(:avatar)
    end
  end
end
