require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see the name of each shelter" do
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

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "next to every shelter is a link to edit that shelter's info" do
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

    visit "/shelters"
    click_link "Edit #{shelter_2.name}"

    expect(current_path).to eq("/shelters/#{shelter_2.id}/edit")

  end
  it "next to every shelter is a link to delete that shelter" do
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

    visit "/shelters"
    click_link "Delete #{shelter_2.name}"

    expect(current_path).to eq("/shelters")
    expect(page).to have_content(shelter_1.name)
    expect(page).not_to have_content(shelter_2.name)

  end

  it "shelter name is a link that takes me to that Shelter's show page" do
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

    visit "/shelters"
    click_link "#{shelter_2.name}"

    expect(current_path).to eq("/shelters/#{shelter_2.id}")
    expect(page).to have_content(shelter_2.name)
    expect(page).not_to have_content(shelter_1.name)
  end


end
# User Story 17, Shelter Links

# As a visitor
# When I click on the name a shelter anywhere on the site
# Then that link takes me to that Shelter's show page
#
# # # User Story 14, Shelter Delete From Shelter Index Page
# # #
# # # As a visitor
# # # When I visit the shelter index page
# # # Next to every shelter, I see a link to delete that shelter
# # # When I click the link
# # # I am returned to the Shelter Index Page where I no longer see that shelter
# #
# # # User Story 13, Shelter Update From Shelter Index Page
# # #
# # # As a visitor
# # # When I visit the shelter index page
# # # Next to every shelter, I see a link to edit that shelter's info
# When I click the link
# I should be taken to that shelters edit page where I can update its information just like in User Story 5
