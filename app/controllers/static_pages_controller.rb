# frozen_string_literal: true

class StaticPagesController < ApplicationController
  
  def home
    @dreampost = current_user.dreamposts.build if logged_in?
    
    # ログイン状態によってhome画面で表示する投稿を分ける(ステータスフィードor全投稿)
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
      @user = current_user
    else
      @feed_items = Dreampost.all.paginate(page: params[:page])      
    end
  end
end
