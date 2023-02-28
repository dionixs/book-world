# frozen_string_literal: true

module ReviewsHelper

  def formatted_created_at(obj)
    obj&.created_at&.strftime('%d.%m.%Y %H:%M:%S')
  end

  def review_read_more_link(review, length, body)
    if plain_text(review, body).length > length
      link_to 'Read more...', '#', class: 'review-read-more'
    end
  end
end
