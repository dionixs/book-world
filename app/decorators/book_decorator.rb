# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  delegate_all

  # TODO
  def short_author_name
    author_name = authors.first&.short_name
    if author_name.present?
      author_name.length > 20 ? "#{author_name[0..19]}..." : author_name
    else
      I18n.t('.decorators.book.unknown')
    end
  end
end
