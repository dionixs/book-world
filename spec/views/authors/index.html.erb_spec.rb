require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        name: "Name",
        bio: "MyText",
        place_of_birth: "Place Of Birth",
        place_of_death: "Place Of Death"
      ),
      Author.create!(
        name: "Name",
        bio: "MyText",
        place_of_birth: "Place Of Birth",
        place_of_death: "Place Of Death"
      )
    ])
  end

  it "renders a list of authors" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Place Of Birth".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Place Of Death".to_s), count: 2
  end
end
