# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def avatar_or_gravatar(size: 30, css_class: '')
    if profile.avatar.attached?
      image_tag_for_avatar(size, css_class)
    else
      image_tag_for_gravatar(size, css_class)
    end
  end

  private

  def image_tag_for_avatar(size, css_class)
    h.image_tag profile.avatar.variant(resize_to_fit: [size, size]).processed,
                class: css_class, alt: username
  end

  def image_tag_for_gravatar(size, css_class)
    h.image_tag "https://www.gravatar.com/avatar/#{profile.gravatar_hash}.jpg?d=retro&s=#{size}&r=PG",
                class: css_class, alt: username
  end
end
