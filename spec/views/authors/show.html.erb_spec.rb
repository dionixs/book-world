require 'rails_helper'

RSpec.describe "authors/show", type: :view do
  before(:each) do
    assign(:author, Author.create!(
      name: "Name",
      bio: "MyText",
      place_of_birth: "Place Of Birth",
      place_of_death: "Place Of Death"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Place Of Birth/)
    expect(rendered).to match(/Place Of Death/)
  end
end
