class ShelterPetsController < ApplicationController
  def index
    shelter_to_find = Shelter.find(params[:shelter_id])
    @pets = shelter_to_find.pets
  end
end
