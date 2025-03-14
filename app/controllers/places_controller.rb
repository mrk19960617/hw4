class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by(id: params[:id])  # Using `params[:id]` to find the place
    @entries = Entry.where(place_id: @place.id, user_id: current_user.id)  # Simplified query
  end

  def new
    @place = Place.new  # Ensure a new Place instance is created for the form
  end

  def create
    @place = Place.new(place_params)  # Use strong parameters here

    if @place.save
      flash[:notice] = "Place created successfully."
      redirect_to places_path  # Use path helper instead of hardcoding the URL
    else
      flash[:error] = "Error creating the place."
      render :new  # Re-render the new place form if save fails
    end
  end

  private

  def place_params
    # Only allow the necessary parameters for creating a place
    params.require(:place).permit(:name)
  end
end
