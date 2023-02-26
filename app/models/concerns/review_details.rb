# frozen_string_literal: true

module ReviewDetails
  extend ActiveSupport::Concern

  included do

    private

    def body_length
      if body.to_plain_text.length < 10
        errors.add(:body, 'must be at least 10 characters long')
      elsif body.to_plain_text.length > 3000
        errors.add(:body, 'must be less than or equal to 3000 characters long')
      end
    end
  end
end
