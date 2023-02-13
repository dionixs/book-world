module BooksHelper
  def stars_for_rating(rating)
    (1..5).map do |i|
      if rating >= i
        content_tag(:i, nil, class: 'bi bi-star-fill text-warning fs-4 me-1')
      elsif rating > (i - 1) && rating < i
        content_tag(:i, nil, class: 'bi bi-star-half text-warning fs-4 me-1')
      else
        content_tag(:i, nil, class: 'bi bi-star fs-4 me-1')
      end
    end.join.html_safe
  end
end
