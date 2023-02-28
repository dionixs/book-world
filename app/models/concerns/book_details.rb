# frozen_string_literal: true

module BookDetails

  extend ActiveSupport::Concern

  included do

    def reviewed_by_user?(user)
      reviews.exists?(user: user)
    end

    def not_reviewed_by_user?(user)
      !reviewed_by_user?(user)
    end
  end
end
