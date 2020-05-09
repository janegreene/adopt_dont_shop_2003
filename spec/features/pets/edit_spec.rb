require 'rails_helper'

RSpec.describe "update pet", type: :feature do
  it "can edit a pet from show page" do
    shelter_1 = Shelter.create(name: "Pawistive Tomorrows",
                         address:      "123 W 66th Ave.",
                         city:  "Denver",
                         state:      "CO",
                         zip:  80221)
    pet_1 = Pet.create(image: "https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                       name:      "Bruce",
                       description: "American bulldog mix, loves 'nilla waffers and RomComs.",
                       approximate_age:  "3 years",
                       sex:      "male",
                       shelter_id: shelter_1.id)
                       #do I need adoption_status or will it default with create in test too


    visit "/pets/#{pet_1.id}"
    click_link "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
    fill_in "image", with: "https://images.unsplash.com/flagged/photo-1579089076211-7ef93768be59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
    fill_in "name", with: "Todd"
    fill_in "description", with: "American bulldog mix, loves 'nilla waffers and RomComs."
    fill_in "approximate_age", with: "3 years"
    fill_in "sex", with: 'male'

    click_button "Update Pet"
    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("Todd")
    expect(page).to have_content("adoptable")
    expect(page).to_not have_content("Bruce")
  end
end

# User Story 11, Pet Update
#
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
