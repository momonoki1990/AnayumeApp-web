# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or root_url
      else
        message = "アカウントが有効になっていません。登録時に送られたメールをご確認いただき、有効化のためのリンクをクリックしてください。"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = '入力されたユーザー名、もしくはパスワードが正しくありません。'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
