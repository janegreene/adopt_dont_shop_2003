require 'rails_helper'

RSpec.describe "shelter pet create", type: :feature do
  it "can create a new pet" do
    shelter_1 = Shelter.create(name: "Pawistive Tomorrows",
                         address:      "123 W 66th Ave.",
                         city:  "Denver",
                         state:      "CO",
                         zip:  80221)

    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
    fill_in "image", with: "https://images.unsplash.com/flagged/photo-1579089076211-7ef93768be59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
    fill_in "name", with: "Todd"
    fill_in "description", with: "Todd is a Westie mix with big dreams and a small budget."
    fill_in "approximate_age", with: "4 years"
    fill_in "sex", with: 'male'

    click_button "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content("Todd")
    expect(page).to have_content("adoptable")
  end
end
