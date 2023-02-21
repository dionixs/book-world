require 'rails_helper'

RSpec.describe Genre, type: :model do

  describe 'associations' do
    it { should have_many(:book_genres) }
    it { should have_many(:books).through(:book_genres) }
    it { should belong_to(:parent).class_name('Genre').optional }
    it { should have_many(:subgenres).class_name('Genre').with_foreign_key('parent_id') }
  end
end
