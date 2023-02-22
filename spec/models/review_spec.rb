require 'rails_helper'

RSpec.describe Review, type: :model do

  describe 'associations' do
    it { should belong_to(:book) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(1).is_at_most(70) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(10).is_at_most(3000) }
  end
end
