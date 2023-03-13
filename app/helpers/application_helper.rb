# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  FLASH_CLASSES = {
    notice: 'alert alert-info',
    success: 'alert alert-success',
    error: 'alert alert-danger',
    alert: 'alert alert-danger'
  }.freeze

  def pagination(obj)
    # rubocop:disable Rails/OutputSafety
    raw(pagy_bootstrap_nav(obj)) if obj.pages > 1
    # rubocop:enable Rails/OutputSafety
  end

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
    plain_text = plain_text(object, attribute)
    truncate(plain_text, length:)
  end

  def plain_text(object, attribute)
    strip_tags(object.send(attribute).to_plain_text)
  end

  def flash_class(level)
    FLASH_CLASSES.fetch(level.to_sym, 'alert alert-danger')
  end

  def icon_tag(icon_name)
    content_tag(:span, class: 'material-icons') do
      icon_name.to_s
    end
  end
end
