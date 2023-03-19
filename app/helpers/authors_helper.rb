# frozen_string_literal: true

module AuthorsHelper
  include ImageHelper

  # TODO
  def author_photo(obj, default_cover: '/images/defaults/default_author_photo.jpg',
                   cover_method: :photo,
                   cover_method_url: :photo_url)
    super
  end
end
