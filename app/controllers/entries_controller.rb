class EntriesController < ApplicationController
  before_action :require_login

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = current_user.id
    @entry.image.attach(params["image"])
    @entry.save

    redirect_to "/places/#{@entry["place_id"]}"
  end
end
