# frozen_string_literal: true

module GenresHelper
  def localized_genre_name(obj)
    I18n.locale == :en ? obj.name_en : obj.name_ru
  end

  # TODO
  def genre_tab(title, url, options = {})
    css_class = current_page?(url) ? 'active' : ''

    options[:class] = if options[:class]
                        "#{options[:class]} #{css_class}"
                      else
                        css_class
                      end

    link_to title, url, options
  end
end
