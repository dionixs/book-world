# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def gravatar(size: 30, css_class: '')
    h.image_tag "https://www.gravatar.com/avatar/#{profile.gravatar_hash}.jpg?d=retro&s=#{size}&r=PG",
                class: css_class, alt: username
  end

end
