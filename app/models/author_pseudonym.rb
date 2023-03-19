# frozen_string_literal: true

class AuthorPseudonym < ActiveRecord::Base
  belongs_to :author
end
