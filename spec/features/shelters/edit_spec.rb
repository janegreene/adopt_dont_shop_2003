require 'rails_helper'

RSpec.describe "update shelter", type: :feature do
  it "can edit a shelter" do


    shelter_3 = Shelter.create(name: "Pet Shelter of Denver",
                  address:      "123 W 66th Ave.",
                  city:  "Denver",
                  state:      "CO",
                  zip:  80221)

    visit "/shelters/#{shelter_3.id}"
    click_link "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter_3.id}/edit")
    fill_in "name", with: "Pet Shelter of Denver"
    fill_in "address", with: "123 W 66th Ave."
    fill_in "city", with: "Denver"
    fill_in "state", with: "OK"
    fill_in "zip", with: 80221
    click_button "submit"

    expect(page).to have_content("Pet Shelter of Denver")
  end
end
