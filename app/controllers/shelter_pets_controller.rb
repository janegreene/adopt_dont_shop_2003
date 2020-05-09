class ShelterPetsController < ApplicationController
  def index
    shelter_to_find = Shelter.find(params[:shelter_id])
    @pets = shelter_to_find.pets
  end

  def create
    Pet.create(:image => params[:image],:name => params[:name], :description => params[:description],
                    :approximate_age => params[:approximate_age], :sex => params[:sex],
                    :adoption_status => params[:adoption_status])

    redirect_to "/shelters/:shelter_id/pets"
  end
end
