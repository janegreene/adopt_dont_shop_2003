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
    # save_and_open_page
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
# User Story 10, Shelter Pet Creation
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
