class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet_id = params[:id]
  end


  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy

    redirect_to "/pets"
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :adoption_status)
  end
end
