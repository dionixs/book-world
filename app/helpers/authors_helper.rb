# frozen_string_literal: true

module AuthorsHelper
  include ImageHelper

  # TODO
  def author_photo(obj, default_photo: '/images/defaults/default_author_photo.jpg')
    if obj.photo.attached?
      url_for(obj.photo)
    elsif obj.photo_url.present?
      obj.photo_url
    else
      url_for(default_photo)
    end
  end

  # TODO
  def initial_letters_range
    if I18n.locale == :ru
      ('А'..'Я').select { |letter| letter != 'Ъ' && letter != 'Ь' }
    else
      ('A'..'Z')
    end
  end
end
