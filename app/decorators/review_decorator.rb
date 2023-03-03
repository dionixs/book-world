# frozen_string_literal: true

class ReviewDecorator < ApplicationDecorator
  delegate_all

  def formatted_created_at
    created_at.strftime('%d.%m.%Y %H:%M:%S')
  end
end
