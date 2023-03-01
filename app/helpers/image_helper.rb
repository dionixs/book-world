# frozen_string_literal: true

module ImageHelper

  def book_cover(obj, default_cover: 'default_cover.jpg', cover_method: :cover)
    if obj.respond_to?(cover_method) && obj.send(cover_method).attached?
      obj.send(cover_method)
    else
      default_cover
    end
  end

  alias author_photo book_cover
end
