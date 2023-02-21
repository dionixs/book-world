# frozen_string_literal: true

module Coverable

  SUPPORTED_IMAGE_TYPES = %w[image/png image/jpg image/jpeg].freeze

  extend ActiveSupport::Concern

  included do

    private

    def correct_cover_type
      return unless cover.attached? && unsupported_image_type?

      unsupported_image_error(:cover)
    end

    def cover_size
      return unless cover.attached? && supported_image_type? && oversize_cover?

      oversize_image_error(:cover)
    end

    def unsupported_image_type?
      !supported_image_type?
    end

    def supported_image_type?
      cover.content_type.in?(SUPPORTED_IMAGE_TYPES)
    end

    def oversize_cover?
      cover.byte_size > 5.megabytes
    end

    def unsupported_image_error(attr)
      errors.add(attr, 'must be a PNG, JPG, or JPEG file')
    end

    def oversize_image_error(attr)
      errors.add(attr, 'size must be less than 5MB')
    end
  end
end
