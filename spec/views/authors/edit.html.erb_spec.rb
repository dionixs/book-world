require 'rails_helper'

RSpec.describe "authors/edit", type: :view do
  let(:author) {
    Author.create!(
      name: "MyString",
      bio: "MyText",
      place_of_birth: "MyString",
      place_of_death: "MyString"
    )
  }

  before(:each) do
    assign(:author, author)
  end

  it "renders the edit author form" do
    render

    assert_select "form[action=?][method=?]", author_path(author), "post" do

      assert_select "input[name=?]", "author[name]"

      assert_select "textarea[name=?]", "author[bio]"

      assert_select "input[name=?]", "author[place_of_birth]"

      assert_select "input[name=?]", "author[place_of_death]"
    end
  end
end
