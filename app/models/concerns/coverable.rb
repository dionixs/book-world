# frozen_string_literal: true

module Coverable

  extend ActiveSupport::Concern

  include AttachableImage

  included do

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
