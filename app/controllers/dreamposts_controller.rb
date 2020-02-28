# frozen_string_literal: true

class DreampostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def show
  end

  def create
    @dreampost = current_user.dreamposts.build(dreampost_params)    
    @user = current_user
    if @dreampost.save
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      flash[:danger] = "内容を入力してください。"
      render 'static_pages/home'
    end
  end

  def destroy
    @dreampost.destroy
    flash[:success] = "投稿が削除されました。"
    redirect_to request.referrer || root_url
  end

  private
  
    def dreampost_params
      params.require(:dreampost).permit(:content, :picture, :in_reply_to)
    end

    def correct_user
      @dreampost = current_user.dreamposts.find_by(id: params[:id])
      redirect_to root_url if @dreampost.nil?
    end

end