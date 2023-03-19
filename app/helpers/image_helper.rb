# frozen_string_literal: true

module ImageHelper
  # TODO
  def book_cover(obj, default_cover: '/images/defaults/default_cover.jpg',
                 cover_method: :cover,
                 cover_method_url: :cover_url)
    return url_for(obj.send(cover_method_url)) if obj.send(cover_method_url) != ''

    if obj.respond_to?(cover_method) && obj.send(cover_method).attached?
      obj.send(cover_method)
    else
      url_for(default_cover)
    end
  end

  alias author_photo book_cover
end
