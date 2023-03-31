# frozen_string_literal: true

require 'rails_helper'

# RSpec.describe Review, type: :model do
#   describe 'associations' do
#     it { should belong_to(:book) }
#   end
#
#   describe 'validations' do
#     it { should validate_presence_of(:title) }
#     it { should validate_length_of(:title).is_at_least(1).is_at_most(70) }
#     it { should validate_presence_of(:body) }
#   end
#
#   describe 'custom validations' do
#     it 'validates the length of body with Trix content' do
#       record = Review.new(body: "<div class='trix-content'>#{'a' * 10}</div>")
#       record.validate
#       expect(record.errors[:body]).not_to include('must be at least 10 characters long')
#     end
#   end
# end
