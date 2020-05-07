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
    # @shelter = Shelter.new
    # @shelter.name = params[:name]
    # @shelter.address = params[:address]
    # @shelter.city = params[:city]
    # @shelter.state = params[:state]
    # @shelter.zip = params[:zip]
    # @shelter.save
    Shelter.create(:name => params[:name], :address => params[:address],
                    :city => params[:city], :state => params[:state],
                    :zip => params[:zip])

    redirect_to "/shelters"
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update_attributes(:name => params[:name], :address => params[:address],
                              :city => params[:city], :state => params[:state],
                              :zip => params[:zip])

    redirect_to "/shelters/#{shelter.id}"
  end

  def delete
    shelter = Shelter.find(params[:id])
    shelter.delete

    redirect_to "/shelters"
  end
end
