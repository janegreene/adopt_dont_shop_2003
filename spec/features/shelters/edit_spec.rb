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
# save_and_open_page
    click_button "submit"

    # expect(current_path).to eq("/shelters/#{shelter.id}")
    expect(page).to have_content("Pet Shelter of Denver")
  end
end

# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
