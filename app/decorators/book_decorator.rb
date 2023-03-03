# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  delegate_all

  def author_name
    author.name
  end
end
