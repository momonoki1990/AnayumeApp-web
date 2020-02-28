# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :following, :followers]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @feed_items = @user.dreamposts.paginate(page: params[:page])
    @dreampost = current_user.dreamposts.build if logged_in?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "送信されたメールをご確認ください。"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "設定が変更されました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "フォロー中"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                      :password_confirmation, :picture)
    end    

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
