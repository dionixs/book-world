# frozen_string_literal: true

module Coverable

  SUPPORTED_IMAGE_TYPES = %w[image/png image/jpg image/jpeg].freeze

  extend ActiveSupport::Concern

  included do

    def download_cover_from_url(cover_url)
      # uri = URI.parse(cover_url)
      #
      # raise ArgumentError, "Invalid URL: #{cover_url}" if uri.scheme.blank? || uri.host.blank?
      #
      # tempfile = Down.open(cover_url)
      # cover.attach(io: tempfile, filename: File.basename(cover_url))
      # tempfile.close
    end

    private

    def add_default_cover
      return if cover.attached?

      cover.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_cover.jpg')),
                   filename: 'default_cover.jpg', content_type: 'image/jpeg')
    end

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
