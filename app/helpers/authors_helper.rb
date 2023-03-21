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

  def birth_info(author, &)
    return unless author.birth_date || author.place_of_birth

    content_tag(:p, &)
  end

  def format_birth_date(author)
    format_date(author.birth_date) if author.birth_date
  end

  def format_birth_place(author)
    author.place_of_birth
  end

  # TODO
  def genres_links(author)
    author.genres_names_with_ids.map do |name, id|
      link_to genre_path(id), class: 'link-dark', title: name do
        name
      end
    end.join(', ').html_safe
  end
end
