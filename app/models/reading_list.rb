# frozen_string_literal: true

class ReadingList < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum reading_status: {
    planned: 0,
    reading: 1,
    rereading: 5,
    completed: 2,
    on_hold: 3,
    dropped: 4
  }

  validates :book_id, uniqueness: { scope: :user_id }
  validates :reading_status, presence: true

  def self.humanized_statuses
    ReadingList.reading_statuses.map { |key, value| [I18n.t("reading_statuses.#{key}"), value] }
  end
end
