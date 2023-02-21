# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper do

  describe '#full_title' do
    context 'when page title is empty' do
      it 'returns the base title' do
        expect(helper.full_title).to eq('BookWorld')
      end
    end

    context 'when page title is not empty' do
      it 'returns the page title followed by the base title' do
        expect(helper.full_title('Contact')).to eq('Contact')
      end
    end
  end
end