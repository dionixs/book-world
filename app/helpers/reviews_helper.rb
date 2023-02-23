# frozen_string_literal: true

module ReviewsHelper

  def formatted_created_at(obj)
    obj&.created_at&.strftime('%d.%m.%Y %H:%M:%S')
  end
end
