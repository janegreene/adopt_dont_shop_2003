require 'rails_helper'

RSpec.describe "shelter create", type: :feature do
  it "can create a new shelter" do

    visit "/shelters"
    click_link "New Shelter"

    expect(current_path).to eq('/shelters/new')
    fill_in "name", with: "Puppy Central"
    fill_in "address", with: "333 W 44th Ave"
    fill_in "city", with: "Oklahoma City"
    fill_in "state", with: "OK"
    fill_in "zip", with: 74013

    click_button "Create Shelter"
    expect(current_path).to eq('/shelters')
    expect(page).to have_link("Puppy Central")
  end
end
