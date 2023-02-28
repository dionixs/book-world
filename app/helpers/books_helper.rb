# frozen_string_literal: true

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

  def cover(obj)
    obj.cover.attached? ? obj.cover : 'default_cover.jpg'
  end

  def gen_book_title
    Faker::Book.title
  end

  def gen_book_author
    Faker::Book.author
  end

  def gen_book_description
    Faker::Lorem.paragraph
  end

  def author_links(book)
    book.author_names_with_ids.map do |name, id|
      link_to name, author_path(id), class: 'link-dark', title: name
    end.join(', ').html_safe
  end

  def book_author_name(book)
    book.author&.name
  end

  def book_author_names(book)
    book.authors.pluck(:name).join(', ')
  end
end
