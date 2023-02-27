# frozen_string_literal: true

module Authorable

  extend ActiveSupport::Concern

  included do

    def author
      authors.first&.name
    end

    def all_author_names
      authors.map(&:name)
    end

    def author_names_with_ids
      authors.pluck(:name, :id)
    end

    private

    def find_or_create_authors
      return unless author_names.present?

      names = author_names.split(',').map(&:strip)

      self.authors = names.map do |name|
        Author.find_or_create_by(name:)
      end
    end
  end
end
