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

    def user_can_only_review_book_once
      return unless Review.exists?(user_id:, book_id:)

      errors.add(:base, message: 'You can only review a book once')
    end

    def validate_images
      if body.present? && body.embeds.present?
        body.embeds.each do |embed|
          if !embed.blob.image? || !%w[image/jpeg image/png image/gif].include?(embed.blob.content_type)
            errors.add(:body, "Only JPEG, PNG and GIF images are allowed")
          elsif embed.blob.byte_size > 5.megabytes
            errors.add(:body, "The image #{embed.blob.filename} cannot be larger than 5MB")
          end
        end
      end
    end

  end
end
