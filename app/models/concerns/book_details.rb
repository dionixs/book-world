# frozen_string_literal: true

module BookDetails
  extend ActiveSupport::Concern

  included do
    def book_author_names
      authors.pluck(:name).join(', ')
    end

    def genre
      genres.pluck("name_#{I18n.locale}".to_sym).join(', ')
    end

    def reviewed_by_user?(user)
      reviews.exists?(user:)
    end

    def not_reviewed_by_user?(user)
      !reviewed_by_user?(user)
    end
  end
end
