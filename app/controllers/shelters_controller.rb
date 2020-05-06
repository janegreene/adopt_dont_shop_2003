class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    # require "pry"; binding.pry
  end

  def create
    @shelter = Shelter.new
    @shelter.name = params[:name]
    @shelter.address = params[:address]
    @shelter.city = params[:city]
    @shelter.state = params[:state]
    @shelter.zip = params[:zip]
    @shelter.save

    redirect_to "/shelters"
    # require "pry"; binding.pry
  end
end
