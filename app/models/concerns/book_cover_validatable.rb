# frozen_string_literal: true

module BookCoverValidatable
  extend ActiveSupport::Concern

  included do

    private

    def correct_cover_type
      return unless cover.attached? && unsupported_image_type?

      errors.add(:cover, 'must be a PNG, JPG, or JPEG file')
    end

    def cover_size
      return unless cover.attached? && supported_image_type? && oversize_cover?

      errors.add(:cover, 'size must be less than 5MB')
    end

    def unsupported_image_type?
      !supported_image_type?
    end

    def supported_image_type?
      cover.content_type.in?(%w[image/png image/jpg image/jpeg])
    end

    def oversize_cover?
      cover.byte_size > 5.megabytes
    end
  end
end
