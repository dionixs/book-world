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
    base_title = I18n.t('.name')
    if page_title.empty?
      base_title
    else
      page_title.to_s
    end
  end

  def nav_tab(title, url, options = {})
    css_class = current_page?(url) ? 'nav-link__orange' : 'nav-link__white'

    options[:class] = if options[:class]
                        "#{options[:class]} #{css_class}"
                      else
                        css_class
                      end

    link_to title, url, options
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

  def format_date(date)
    case I18n.locale
    when :ru
      # rubocop:disable Style/FormatStringToken
      date.strftime('%e %{month} %Y г.')
          .gsub(/%\{month\}/, I18n.t('date.month_names')[date.month])
      # rubocop:enable Style/FormatStringToken
    when :en
      date.strftime('%B %e, %Y')
    else
      date.to_s
    end
  end
end
