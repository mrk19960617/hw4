class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by(id: params[:id])
    @entries = Entry.where(place_id: @place.id, user_id: current_user.id)
  end

  def new
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  private

  def place_params
    # Permit only the name of the place to be passed in
    params.require(:place).permit(:name)
  end
end
