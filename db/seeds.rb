# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create(name: "Pawsitive Tomorrows",
                     address:      "123 W 66th Ave.",
                     city:  "Denver",
                     state:      "CO",
                     zip:  80221)
shelter_2 = Shelter.create(name: "Pet Palace",
                    address:      "334 West Ave.",
                    city:  "Thornton",
                    state:      "CO",
                    zip:  98998)
pet_1 = Pet.create(image: "https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                   name:      "Randy",
                   approximate_age:  "3 years",
                   sex:      "male",
                   shelter_id: shelter_1.id)
pet_2 = Pet.create(image: "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                   name:      "Lucy",
                   approximate_age:  "6 months",
                   sex:      "female",
                   shelter_id: shelter_1.id,
                   description: "Lucy should not be trusted around fire.",
                   adoption_status: "adoptable")

pet_3 = Pet.create(image: "https://images.unsplash.com/photo-1535930891776-0c2dfb7fda1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                   name:      "Larry",
                   approximate_age:  "9 months",
                   sex:      "male",
                   shelter_id: shelter_1.id,
                   description: "Larry will eat your homework.",
                   adoption_status: "adoptable")

 pet_4 = Pet.create(image: "https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                    name:      "Randy",
                    approximate_age:  "3 years",
                    sex:      "male",
                    shelter_id: shelter_2.id,
                    description: "Randy is a playful pup who likes short walks on long beaches.",
                   adoption_status: "adoptable")
 pet_5 = Pet.create(image: "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                    name:      "Lucy",
                    approximate_age:  "6 months",
                    sex:      "female",
                    shelter_id: shelter_2.id,
                    description: "Lucy loves bathtime and reading romance novels aloud.",
                    adoption_status: "pending")
 pet_6 = Pet.create(image: "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                   name:      "Olive",
                   approximate_age:  "10 months",
                   sex:      "female",
                   shelter_id: shelter_2.id,
                   description: "Olive is going through a punk rock phase and exculsively wears vegan leather.",
                   adoption_status: "adoptable")
