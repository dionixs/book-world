# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  delegate_all

  delegate :name, to: :author, prefix: true
end
