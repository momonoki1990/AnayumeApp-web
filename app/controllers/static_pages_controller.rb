# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    # ログイン状態によってhome画面で表示する投稿を分ける(ステータスフィードor全投稿)
    if logged_in?
      @user = current_user
      @feed_items = @user.feed.page(params[:page]).per(10)
      @dreampost = @user.dreamposts.build
    else
      @feed_items = Dreampost.all.page(params[:page]).per(10)
    end
  end
end
