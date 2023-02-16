module BookDetails
  extend ActiveSupport::Concern

  included do
    before_validation :set_default_cover, if: -> { cover.blank? }
  end

  def set_default_cover
    self.cover ||= 'cover.jpg'
  end
end