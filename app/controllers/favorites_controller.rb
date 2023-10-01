class FavoritesController < ApplicationController

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
    # params.require(:favorite).permit(item_id: params[:item_id]).merge(user_id: current_user.id)
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def favorite_check 
    Favorite.where(user_id: current_user.id, item_id: params[:item_id]).blank? 
  end

end
