class MapsController < ApplicationController
  before_action :logged_in_user, only: %i[map create destroy]
  def index
    @map = Map.new
    @maps = current_user.maps
  end

  def map
    @address = params[:address]
    results = Geocoder.search(@address)
    @latlng = results.first.coordinates
    # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。
    @map = Map.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @map = current_user.maps.build(map_params)
    @user = current_user
    if @map.save
      redirect_to maps_url
    else
      flash.now[:danger] = @map.errors.full_messages.to_sentence
      render 'maps/index'
    end
  end

  def destroy; end

  private

  def map_params
    params.require(:map).permit(:address, :latitude, :longitude, :title, :comment, :picture)
  end
end
