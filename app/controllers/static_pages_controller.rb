# frozen_string_literal: true

class StaticPagesController < ApplicationController
  
  def home
    @dreampost = current_user.dreamposts.build if logged_in?
    @feed_items = Dreampost.all.paginate(page: params[:page])
  end
end
