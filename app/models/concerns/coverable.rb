# frozen_string_literal: true

module Coverable
  extend ActiveSupport::Concern

  include AttachableImage
  include ImageValidatable

  included do

    def download_cover(image_url)
      download_image(:cover, image_url)
    end

    private

    def add_default_cover
      add_default_image(:cover, 'default_cover.jpg')
    end

    def correct_cover_type
      correct_image_type(:cover)
    end

    def cover_size
      image_size(:cover)
    end
  end
end
