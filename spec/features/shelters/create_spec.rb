require 'rails_helper'

RSpec.describe "shelter create", type: :feature do
  it "can create a new shelter" do

    visit "/shelters"
    click_link "New Shelter"
    shelter_3 = Shelter.create(name: "Pet Shelter of Denver",
                  address:      "123 W 66th Ave.",
                  city:  "Denver",
                  state:      "CO",
                  zip:  80221)
# save_and_open_page
    expect(current_path).to eq('/shelters/new')
    fill_in "name", with: "Puppy Central"
    fill_in "address", with: "333 W 44th Ave"
    fill_in "city", with: "Oklahoma City"
    fill_in "state", with: "OK"
    fill_in "zip", with: 74013

    click_button "Create Shelter"
    expect(current_path).to eq('/shelters')
    expect(page).to have_link("Puppy Central")
    expect(Shelter.all.count).to eq(2)
  end
end
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
