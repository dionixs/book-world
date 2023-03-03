# frozen_string_literal: true
# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe ApplicationHelper do
#   describe '#full_title' do
#     context 'when page title is empty' do
#       it 'returns the base title' do
#         expect(helper.full_title).to eq('BookWorld')
#       end
#     end
#
#     context 'when page title is not empty' do
#       it 'returns the page title followed by the base title' do
#         expect(helper.full_title('Contact')).to eq('Contact')
#       end
#     end
#   end
#
#   describe '#summary' do
#     it 'truncates the given text to the specified length' do
#       object = double('Object')
#       body = '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>'
#       allow(object).to receive(:send).with(:attribute).and_return(ActionText::RichText.create(body:))
#       result = helper.summary(object, :attribute, length: 20)
#       expect(result).to eq('Lorem ipsum dolor...')
#     end
#
#     it 'uses the default length of 200 characters if no length is specified' do
#       object = double('Object')
#       body = '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>'
#       allow(object).to receive(:send).with(:attribute).and_return(ActionText::RichText.create(body:))
#       result = helper.summary(object, :attribute)
#       expect(result).to eq('Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
#     end
#   end
# end
