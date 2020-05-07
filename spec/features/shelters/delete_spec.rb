require 'rails_helper'

RSpec.describe "shelter delete", type: :feature do
  it "can delete a shelter" do
    shelter_1 = Shelter.create(name: "Pawistive Tomorrows",
                         address:      "123 W 66th Ave.",
                         city:  "Denver",
                         state:      "CO",
                         zip:  80221)
    shelter_2 = Shelter.create(name: "Denver Animal Shelter",
                         address:       "4123 W 86th Pl.",
                         city:  "Denver",
                         state:      "CO",
                         zip:  82126)

    expect(Shelter.all.count).to eq(2)
    visit "/shelters/#{shelter_2.id}"
    click_link "DELETE"
    expect(current_path).to eq("/shelters")
    expect(Shelter.all.count).to eq(1)
  end
end
# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
