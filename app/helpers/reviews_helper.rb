# frozen_string_literal: true

module ReviewsHelper
  def review_read_more_link(review, length, body)
    return unless plain_text(review, body).length > length

    link_to 'Read more...', '#', class: 'review-read-more'
  end
end
