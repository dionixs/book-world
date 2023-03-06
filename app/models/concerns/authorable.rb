# frozen_string_literal: true

module Authorable
  extend ActiveSupport::Concern

  included do

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
      names = names.split(',').map(&:strip)

      self.authors = names.map do |name|
        Author.find_or_create_by(name:)
      end
    end
  end
end
