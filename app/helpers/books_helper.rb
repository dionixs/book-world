# frozen_string_literal: true

module BooksHelper
  include ImageHelper
  include GenresHelper

  def stars_for_rating(rating)
    # rubocop:disable Rails/OutputSafety
    (1..5).map do |i|
      if rating >= i
        content_tag(:i, nil, class: 'bi bi-star-fill text-warning fs-4 me-1')
      elsif rating > (i - 1) && rating < i
        content_tag(:i, nil, class: 'bi bi-star-half text-warning fs-4 me-1')
      else
        content_tag(:i, nil, class: 'bi bi-star fs-4 me-1')
      end
    end.join.html_safe
    # rubocop:enable Rails/OutputSafety
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

  # todo
  def author_links(book)
    # rubocop:disable Rails/OutputSafety
    book.author_names_with_ids.map do |name, id|
      link_to author_path(id), class: 'link-dark', title: name do
        name
      end
    end.join(', ').html_safe
    # rubocop:enable Rails/OutputSafety
  end

  # todo
  def genres_links(book)
    book.genres_names_with_ids.map do |name, id|
      link_to genre_path(id), class: 'link-dark', title: name do
        name
      end
    end.join(', ').html_safe
  end

  def book_editable?
    controller_name == 'books' && action_name.in?(%w[edit update])
  end
end
