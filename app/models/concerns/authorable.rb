# frozen_string_literal: true

module Authorable
  extend ActiveSupport::Concern

  included do
    attr_accessor :author_names

    def author
      author_names_with_separator(', ')
    end

    def first_author
      authors.first
    end

    def author?
      authors.present?
    end

    def author_names_with_ids
      authors.pluck(:name, :id)
    end

    def author_names
      author_names_with_separator(',')
    end

    def author_names=(names)
      names = names.split(',').map(&:strip)

      self.authors = names.map do |name|
        Author.find_or_create_by(name:)
      end
    end

    private

    def author_names_with_separator(separator)
      authors.pluck(:name).join(separator)
    end
  end
end
