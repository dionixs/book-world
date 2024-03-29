# frozen_string_literal: true

module BookDetails
  extend ActiveSupport::Concern

  included do

    # TODO
    def genres_names_with_ids
      genres.pluck("name_#{I18n.locale}".to_sym, :id)
    end

    def book_author_names
      authors.pluck(:short_name).join(', ')
    end

    # TODO
    def genre
      genres.pluck("name_#{I18n.locale}".to_sym).join(', ')
    end

    def self.without_authors
      where.missing(:authors)
    end

    def reviewed_by_user?(user)
      reviews.exists?(user:)
    end

    def not_reviewed_by_user?(user)
      !reviewed_by_user?(user)
    end
  end
end
