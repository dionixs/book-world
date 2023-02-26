# frozen_string_literal: true

module BookDetails

  extend ActiveSupport::Concern

  included do

    private

    def description_length
      errors.add(:description, 'is too long (maximum is 3000 characters)') if description.to_plain_text.length > 3000
    end
  end
end
