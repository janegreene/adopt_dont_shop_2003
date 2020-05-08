require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it " can see each Pet in the system including the Pet's image, name, age, sex, location" do
    shelter_1 = Shelter.create(name: "Pawsitive Tomorrows",
                         address:      "123 W 66th Ave.",
                         city:  "Denver",
                         state:      "CO",
                         zip:  80221)

    pet_1 = Pet.create(image: "https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                       name:      "Randy",
                       approximate_age:  "3 years",
                       sex:      "male",
                       shelter_id: shelter_1.id)
    pet_2 = Pet.create(image: "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                       name:      "Lucy",
                       approximate_age:  "6 months",
                       sex:      "female",
                       shelter_id: shelter_1.id)
    visit "/pets"
    expect(page).to have_content(pet_1.name)
    page.find("#pet-avatar-#{pet_1.id}")['src'].should have_content pet_1.image
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.shelter.name)
    expect(page).to have_content(pet_2.name)
  end
end
