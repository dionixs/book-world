# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'BookWorld'
    if page_title.empty?
      base_title
    else
      page_title.to_s
    end
  end

  def summary(object, attribute, options = {})
    length = options[:length] || 200
    plain_text = strip_tags(object.send(attribute).to_plain_text)
    truncate(plain_text, length: length)
  end

  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-danger"
      when :alert then "alert alert-danger"
    end
  end
end
