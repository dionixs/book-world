# frozen_string_literal: true

module GenresHelper
  def localized_genre_name(obj)
    I18n.locale == :en ? obj.name_en : obj.name_ru
  end
end
