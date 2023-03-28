# frozen_string_literal: true

module Authorable
  extend ActiveSupport::Concern

  included do
    attr_accessor :author_names
    attr_reader :pseudonyms

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
      authors.pluck(:short_name, :id)
    end

    def author_names
      author_names_with_separator(',')
    end

    def pseudonyms
      author_pseudonyms.pluck(:name).join(', ')
    end

    def author_names=(names)
      names = names.split(',').map(&:strip)

      self.authors = names.map do |short_name|
        Author.find_or_create_by(short_name:)
      end
    end

    private

    def author_names_with_separator(separator)
      authors.pluck(:short_name).join(separator)
    end
  end
end
