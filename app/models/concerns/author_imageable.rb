# frozen_string_literal: true

module AuthorImageable
  extend ActiveSupport::Concern

  include AttachableImage
  include ImageValidatable

  included do
    def download_photo(image_url)
      download_image(:photo, image_url)
    end

    private
    
    def correct_photo_type
      correct_image_type(:photo)
    end

    def photo_size
      image_size(:photo)
    end
  end
end
