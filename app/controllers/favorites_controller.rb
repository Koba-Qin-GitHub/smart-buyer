class FavoritesController < ApplicationController
  def create
    # binding.pry
    
    favorite = current_user.favorites.build(item_id: params[:item_id])
    favorite.save


  #   @favorite = Favorite.new(favorite_params)
  #   if @favorite.save
  #     # render :show
  #     puts '登録しました！'
  #   else
  #     puts '登録に失敗しました。'
  #   end 
  end

  def destroy
    # binding.pry
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy

  end


  private

  def favorite_params
    params.require(:favorite).permit(item_id: params[:item_id]).merge(user_id: current_user.id)
    # params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipment_date_id, :image).merge(user_id: current_user.id) 
  end

end
