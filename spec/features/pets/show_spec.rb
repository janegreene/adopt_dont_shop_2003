require 'rails_helper'


RSpec.describe "pet show page", type: :feature do
  it "can see the pet details" do
    shelter_1 = Shelter.create(name: "Pawsitive Tomorrows",
                         address:      "123 W 66th Ave.",
                         city:  "Denver",
                         state:      "CO",
                         zip:  80221)

    pet_1 = Pet.create(image: "https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                       name:      "Randy",
                       approximate_age:  "3 years",
                       sex:      "male",
                       shelter_id: shelter_1.id,
                       description: "Randy is a playful pup who likes short walks on long beaches.",
                      adoption_status: "adoptable")
    pet_2 = Pet.create(image: "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                       name:      "Lucy",
                       approximate_age:  "6 months",
                       sex:      "female",
                       shelter_id: shelter_1.id,
                       description: "Lucy loves bathtime and reading romance novels aloud.",
                       adoption_status: "pending")

    visit "/pets/#{pet_1.id}"

    page.find("#pet-avatar-#{pet_1.id}")['src'].should have_content pet_1.image
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.adoption_status)
    expect(page).not_to have_content(pet_2.name)
    expect(page).not_to have_content(pet_2.description)
    expect(page).not_to have_content(pet_2.approximate_age)
    expect(page).not_to have_content(pet_2.adoption_status)
  end
end
