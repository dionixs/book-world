require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Book, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(0.0).is_less_than_or_equal_to(5.0) }
  end

  describe "#set_default_cover" do
    it "should set the default cover" do
      book = Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', description: 'A novel about decadence and excess in 1920s New York', genre: 'Fiction', rating: 4)
      book.valid?
      expect(book.cover).to eq('default_cover.jpg')
    end

    it "should not set the default cover if it is already set" do
      book = Book.new(title: 'To Kill a Mockingbird', author: 'Harper Lee', description: 'A novel about racial injustice in the American South', genre: 'Fiction', rating: 5, cover: 'custom_cover.jpg')
      book.valid?
      expect(book.cover).to eq('custom_cover.jpg')
    end
  end

  describe 'creating a book' do
    it 'creates a valid book' do
      book = Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', description: 'A classic novel about the decadence of the Roaring Twenties', genre: 'Literary Fiction', rating: 4, cover: 'https://example.com/the-great-gatsby.jpg')
      expect(book).to be_valid
    end
  end

  describe 'creating an invalid book' do
    it 'does not create a valid book' do
      book = Book.new(title: '', author: '', description: '', genre: '', rating: 6, cover: '')
      expect(book).to_not be_valid
    end
  end

  describe "#normalize_genre" do
    it "should normalize the genre to lowercase" do
      book = Book.new(title: 'The Lord of the Rings', author: 'J.R.R. Tolkien', description: 'An epic high-fantasy novel set in Middle-earth', genre: 'Fantasy', rating: 5)
      book.save
      expect(book.genre).to eq('fantasy')
    end
  end
end