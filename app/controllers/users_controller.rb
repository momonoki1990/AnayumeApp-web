# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録に成功しました！"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit; end

  def following; end

  def followers; end

  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                      :password_confirmation)
    end
end
