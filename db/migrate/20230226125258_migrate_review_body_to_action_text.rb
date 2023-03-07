# frozen_string_literal: true

class MigrateReviewBodyToActionText < ActiveRecord::Migration[7.0]
  include ActionView::Helpers::TextHelper

  def up
    rename_column :reviews, :body, :old_body

    if Review.any?
      Review.all.each do |review|
        # rubocop:disable Rails/SkipsModelValidations
        review.update_attribute(:body, simple_format(review.old_body))
        # rubocop:enable Rails/SkipsModelValidations
      end
    end
    remove_column :reviews, :old_body
  end

  def down
    add_column :reviews, :old_body, :text

    if Review.any?
      Review.all.each do |review|
        # rubocop:disable Rails/SkipsModelValidations
        review.update_attribute(:old_body, review.body.to_plain_text)
        # rubocop:enable Rails/SkipsModelValidations
        review.body.delete
      end
    end

    rename_column :reviews, :old_body, :body
  end
end
