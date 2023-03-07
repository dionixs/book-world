# frozen_string_literal: true

module Authorable
  extend ActiveSupport::Concern

  included do
    attr_accessor :author_names

    def first_author
      authors.first
    end

    def author_names_with_ids
      authors.pluck(:name, :id)
    end

    def author_names
      authors.pluck(:name).join(',')
    end

    def author_names=(names)
      return unless valid?(:at_least_one_author)

      names = names.split(',').map(&:strip)

      self.authors = names.map do |name|
        Author.find_or_create_by(name:)
      end
    end

    private

    def at_least_one_author
      return unless author_names.blank? || author_names.split(',').count < 1

      errors.add(:author_names, 'must contain at least one author name')
    end
  end
end
