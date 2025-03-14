class EntriesController < ApplicationController
  before_action :require_login  # Ensures the user is logged in before they can create an entry

  def new
    @place = Place.find_by(id: params[:place_id])  # Find place by its ID from the params
  end

  def create
    # Create a new entry object and assign attributes from params
    @entry = Entry.new(entry_params)  # Using strong parameters to safely assign values

    # Associate the entry with the logged-in user
    @entry.user_id = current_user.id

    # Attach the image if provided
    if params[:image].present?
      @entry.image.attach(params[:image])
    end

    if @entry.save
      flash[:notice] = "Entry created successfully."
      redirect_to place_path(@entry.place)  # Redirect back to the place show page
    else
      flash[:error] = "There was an error creating the entry."
      render :new  # Re-render the new entry form if save fails
    end
  end

  private

  def entry_params
    # Allowing only the necessary parameters from the form to prevent mass-assignment vulnerabilities
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id, :image)
  end
end
