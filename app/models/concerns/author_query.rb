# frozen_string_literal: true

module AuthorQuery
  extend ActiveSupport::Concern

  included do

    def self.by_initial_letter(initial)
      where("UPPER(LEFT(SPLIT_PART(short_name, ' ', -1), 1)) = ?", initial.upcase)
    end
  end
end
