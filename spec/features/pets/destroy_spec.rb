require 'rails_helper'

RSpec.describe "Destroy a Pet" do
  describe "When I visit a pet show page" do
    it "I can delete a pet" do
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
      pet_3 = Pet.create(image: "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                        name:      "Olive",
                        approximate_age:  "10 months",
                        sex:      "female",
                        shelter_id: shelter_1.id,
                        description: "Olive is going through a punk rock phase and exculsively wears vegan leather.",
                        adoption_status: "adoptable")

      visit '/pets'
      expect(page).to have_content(pet_1.name)

      visit "/pets/#{pet_1.id}"

      click_button "Delete Pet"

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Randy")
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_3.name)
    end
  end
end

# User Story 12, Pet Delete
#
# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
