# frozen_string_literal: true

module ImageValidatable

  SUPPORTED_IMAGE_TYPES = %w[image/png image/jpg image/jpeg].freeze

  extend ActiveSupport::Concern

  included do

    private

    def correct_image_type(attr)
      return unless send(attr).attached? && unsupported_image_type?(attr)

      unsupported_image_error(attr)
    end

    def image_size(attr)
      return unless send(attr).attached? && supported_image_type?(attr) && oversize_image?(attr)

      oversize_image_error(attr)
    end

    def unsupported_image_type?(attr)
      !supported_image_type?(attr)
    end

    def supported_image_type?(attr)
      send(attr).content_type.in?(SUPPORTED_IMAGE_TYPES)
    end

    def oversize_image?(attr)
      send(attr).byte_size > 5.megabytes
    end

    def unsupported_image_error(attr)
      errors.add(attr, 'must be a PNG, JPG, or JPEG file')
    end

    def oversize_image_error(attr)
      errors.add(attr, 'size must be less than 5MB')
    end
  end
end
