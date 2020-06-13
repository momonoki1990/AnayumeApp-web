class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @dreampost = Dreampost.find(params[:dreampost_id])
    return if @dreampost.like?(current_user)
    
    @dreampost.like(current_user)
    @dreampost.reload
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    @dreampost = Like.find(params[:id]).dreampost
    return unless @dreampost.like?(current_user)

    @dreampost.unlike(current_user)
    @dreampost.reload
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
