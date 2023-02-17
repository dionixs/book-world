# frozen_string_literal: true

class UniqueTitleAuthorCombinationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless Book.exists?(title: record.title, author: record.author)

    record.errors.add(attribute, 'and author combination already exists')
  end
end