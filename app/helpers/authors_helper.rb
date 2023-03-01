# frozen_string_literal: true

module AuthorsHelper
  include ImageHelper

  def author_photo(obj, default_cover: 'default_author_photo.jpg', cover_method: :photo)
    super
  end
end
