# frozen_string_literal: true
# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe BooksHelper, type: :helper do
#   describe '#stars_for_rating' do
#     it 'displays 5 filled stars for rating of 5' do
#       expect(helper.stars_for_rating(5)).to eq('<i class="bi bi-star-fill text-warning fs-4 me-1"></i>' * 5)
#     end
#
#     it 'displays 3 filled stars and 2 empty stars for rating of 3' do
#       expect(helper.stars_for_rating(3)).to eq(('<i class="bi bi-star-fill text-warning fs-4 me-1"></i>' * 3) + ('<i class="bi bi-star fs-4 me-1"></i>' * 2))
#     end
#
#     it 'displays 1 filled star and 4 empty stars for rating of 1' do
#       expect(helper.stars_for_rating(1)).to eq("<i class=\"bi bi-star-fill text-warning fs-4 me-1\"></i>#{'<i class="bi bi-star fs-4 me-1"></i>' * 4}")
#     end
#   end
#
#   describe '#cover' do
#     it 'returns the attached cover if it exists' do
#       book = create(:book)
#       expect(helper.cover(book)).to eq(book.cover)
#     end
#   end
#
#   describe '#gen_book_title' do
#     it 'returns a random book title' do
#       expect(helper.gen_book_title).to_not be_nil
#     end
#   end
#
#   describe '#gen_book_author' do
#     it 'returns a random book author' do
#       expect(helper.gen_book_author).to_not be_nil
#     end
#   end
#
#   describe '#gen_book_description' do
#     it 'returns a random book description' do
#       expect(helper.gen_book_description).to_not be_nil
#     end
#   end
# end
