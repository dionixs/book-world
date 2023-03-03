# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'authors/new', type: :view do
  before(:each) do
    assign(:author, Author.new(
                      name: 'MyString',
                      bio: 'MyText',
                      place_of_birth: 'MyString',
                      place_of_death: 'MyString'
                    ))
  end

  it 'renders new author form' do
    render

    assert_select 'form[action=?][method=?]', authors_path, 'post' do
      assert_select 'input[name=?]', 'author[name]'

      assert_select 'textarea[name=?]', 'author[bio]'

      assert_select 'input[name=?]', 'author[place_of_birth]'

      assert_select 'input[name=?]', 'author[place_of_death]'
    end
  end
end
