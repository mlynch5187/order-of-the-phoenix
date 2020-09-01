require 'rails_helper'

RSpec.describe "As a user" do
  it "selects house and shows me house members" do

    visit '/'

    select "Gryffindor", from: :house

    click_on "Search For Members"

    expect(current_path).to eq('/search')

    expect(page).to have_content("21 Members")

    expect(page).to have_css('.members')
    expect(page).to have_css('.role')
    expect(page).to have_css('.house')
    expect(page).to have_css('.patronus')
  end
end
