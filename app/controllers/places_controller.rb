class PlacesController < ApplicationController
  before_action :require_login  # Require user to be logged in

  def index
    @places = Place.all  # Show all places
  end

  def show
    @place = Place.find_by(id: params["id"])  # Find a specific place by ID
    @entries = Entry.where(place_id: @place["id"], user_id: current_user.id)  # Show only the user's entries for this place
  end

  def new
  end

  def create
    @place = Place.new(name: params["name"])  # Create a new place

    if @place.save  # Save the place if valid
      redirect_to "/places"  # Redirect to places index
    else
      render :new  # If save fails, re-render the form
    end
  end
end
