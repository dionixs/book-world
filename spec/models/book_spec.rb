require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Book, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:genre) }
    it { should validate_numericality_of(:rating).only_integer }
    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
    it { should validate_presence_of(:cover) }
  end

  describe 'creating a book' do
    it 'creates a valid book' do
      book = Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', description: 'A classic novel about the decadence of the Roaring Twenties', genre: 'Literary Fiction', rating: 4, cover: 'https://example.com/the-great-gatsby.jpg')
      expect(book).to be_valid
    end
  end
end