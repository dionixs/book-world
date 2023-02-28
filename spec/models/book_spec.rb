# frozen_string_literal: true
require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Book, type: :model do

  let(:book) { create(:book) }

  describe 'associations' do
    it { should have_many(:reviews) }
    it { should have_many(:book_genres).dependent(:destroy) }
    it { should have_many(:genres).through(:book_genres) }
    it { should have_one_attached(:cover) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(1).is_at_most(70) }
    it { should validate_length_of(:description).is_at_most(3000) }
    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(0.0).is_less_than_or_equal_to(5.0) }
  end

  describe 'custom validations' do

    it 'should set the default cover' do
      book = Book.new(title: 'The Great Gatsby', description: 'A novel about decadence and excess in 1920s New York', rating: 4)
      book.valid?
      expect(book.cover.attached?).to eq(false)
    end

    it 'should validate correct cover type' do
      book.cover.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test.txt')), filename: 'test.txt',
                        content_type: 'text/plain')
      expect(book).not_to be_valid
      expect(book.errors[:cover]).to include('must be a PNG, JPG, or JPEG file')
    end

    it 'should validate cover size' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'cover.jpg'), 'image/jpeg')
      book.cover.attach(file)
      expect(book).to be_valid

      # Test for maximum cover size
      too_large_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'large_image.jpeg'), 'image/jpeg')
      book.cover.attach(too_large_file)
      expect(book).not_to be_valid
      expect(book.errors[:cover]).to include('size must be less than 5MB')
    end
  end

  describe 'creating a book with cover' do
    it 'creates a book with cover attached' do
      book = build(:book)
      expect(book.cover).to be_attached
      expect(book.cover.content_type).to eq('image/jpeg')
      expect(book.cover.byte_size).to be <= 5.megabytes
    end
  end

  context 'with valid attributes' do
    let(:book) { build(:book, author_names: 'John Doe') }

    it 'is valid' do
      expect(book).to be_valid
    end
  end

  context 'with invalid attributes' do
    let(:book) { build(:book, author_names: 'x' * 71) }

    it 'is invalid' do
      expect(book).to be_invalid
    end
  end
end
