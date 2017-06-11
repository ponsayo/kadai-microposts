class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    if logged_in?
      @user = current_user
      @microposts = current_user.favorite_microposts.page(params[:page])
    end
  end
  
  
  def create
    micropost = Micropost.find(params[:micropost_id]) 
    current_user.favorite(micropost)
    flash[:success] = 'お気に入りに追加しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りを解除しました'
    redirect_back(fallback_location: root_path)
  end
end
