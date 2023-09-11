class FavoritesController < ApplicationController
  def create

    favorite = current_user.favorites.build(item_id: params[:item_id])
    item_search_result = Item.where(name: favorite.item.name)
    favorite_check = Favorite.where(user_id: current_user.id, item_id: item_search_result).blank? 

    
    # binding.pry
    if favorite_check    # ユーザーにとって初めて登録する「正式品番」の場合、保存する
      favorite.save
    end


  #   @favorite = Favorite.new(favorite_params)
  #   if @favorite.save
  #     # render :show
  #     puts '登録しました！'
  #   else
  #     puts '登録に失敗しました。'
  #   end 
  end

  def destroy
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer     # 同じページへリダイレクトする


    # if favorite.present?      # favorite に 「値が存在するのか」を判定
    #   favorite.destroy
    # end

  end


  private

  def favorite_params
    params.require(:favorite).permit(item_id: params[:item_id]).merge(user_id: current_user.id)
    # params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipment_date_id, :image).merge(user_id: current_user.id) 
  end

end
