# frozen_string_literal: true

module Statusable
  extend ActiveSupport::Concern

  included do

    def self.active
      where(status: 'active')
    end

    def self.archived
      where(status: 'archived')
    end

    def active?
      status == 'active'
    end

    def archived?
      status == 'archived'
    end
  end
end
