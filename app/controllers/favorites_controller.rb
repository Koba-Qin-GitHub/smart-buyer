class FavoritesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_user, only:[:create, :destroy]


  def create

    @favorite = Favorite.new(favorite_params)
    
    if favorite_check
      @favorite.save      
      redirect_to request.referer
    else
      redirect_to request.referer
    end 

  end

  
  def destroy

    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)


    if FavoriteItemData.find_by(favorite_id: favorite.id).blank?

    else
      favorite_item_data = FavoriteItemData.where(favorite_id: favorite.id)
      favorite_item_data.delete_all
    end


    if Reminder.find_by(favorite_id: favorite.id).blank?
      favorite.destroy
      redirect_to request.referer
    else
      reminder = Reminder.find_by(favorite_id: favorite.id)
      reminder.destroy
      favorite.destroy
      redirect_to request.referer
    end

  end


  private

  def favorite_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def favorite_check 
    Favorite.where(user_id: current_user.id, item_id: params[:item_id]).blank? 
  end

  def check_user
    @user = User.find(Item.find(params[:item_id]).user.id)

    # 遷移前後のユーザーが「同一」かどうかチェック
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

  end

end
