require 'rails_helper'


RSpec.describe "shelter show page", type: :feature do
  it "can see the shelter details" do
    shelter_1 = Shelter.create(name: "Pawistive Tomorrows",
                         address:      "123 W 66th Ave.",
                         city:  "Denver",
                         state:      "CO",
                         zip:  80221)
    shelter_2 = Shelter.create(name: "Denver Animal Shelter",
                         address:       "4123 W 86th Pl.",
                         city:  "Fort Collins",
                         state:      "CO",
                         zip:  82126)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
    expect(page).not_to have_content(shelter_2.name)
    expect(page).not_to have_content(shelter_2.address)
    expect(page).not_to have_content(shelter_2.city)
    expect(page).not_to have_content(shelter_2.zip)
  end

  it "has a link to pet index" do
    shelter_2 = Shelter.create(name: "Denver Animal Shelter",
                         address:       "4123 W 86th Pl.",
                         city:  "Denver",
                         state:      "CO",
                         zip:  82126)

    visit "/shelters/#{shelter_2.id}"
    click_link "All Pets"

    expect(current_path).to eq("/pets")
  end
  it "has a link to shelter index" do
    shelter_2 = Shelter.create(name: "Denver Animal Shelter",
                         address:       "4123 W 86th Pl.",
                         city:  "Denver",
                         state:      "CO",
                         zip:  82126)

    visit "/shelters/#{shelter_2.id}"
    click_link "All Shelters"

    expect(current_path).to eq("/shelters")
  end
end
