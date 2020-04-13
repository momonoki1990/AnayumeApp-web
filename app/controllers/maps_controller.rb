class MapsController < ApplicationController
  before_action :logged_in_user, only: %i[index create destroy]
  before_action :correct_user, only: :destroy

  def index
    @map = Map.new
    @maps = current_user.map_list
    @maps_paginate = @maps.page(params[:page]).per(10)
  end

  def create
    @map = current_user.maps.build(map_params)
    @user = current_user
    if @map.save
      redirect_to maps_url
    else
      @maps = current_user.map_list
      if @map.latitude.nil?
        flash.now[:danger] = "場所を検索してから保存ボタンを押してください。"
      else
        flash.now[:danger] = "もう一度場所を検索し、タイトルを入力してから保存ボタンを押してください。"
      end
      render 'maps/index'
    end
  end

  def destroy
    @map.destroy
    flash[:success] = "リストから削除されました。"
    redirect_to request.referrer || maps_url
  end

  private

  def map_params
    params.require(:map).permit(:address, :latitude, :longitude, :title, :comment, :picture)
  end

  def correct_user
    @map = current_user.maps.find_by(id: params[:id])
    redirect_to maps_url if @map.nil?
  end
end
