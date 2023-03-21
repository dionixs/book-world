# frozen_string_literal: true

module ImageHelper
  # TODO
  def book_cover(obj, default_cover: '/images/defaults/default_cover.jpg')
    if obj.cover.attached?
      url_for(obj.photo)
    elsif obj.cover_url.present?
      obj.cover_url
    else
      url_for(default_cover)
    end
  end

  # alias author_photo book_cover
end
