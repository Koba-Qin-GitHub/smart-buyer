class FavoritesController < ApplicationController
  def create
    # binding.pry
    @favorite = Favorite.new(favorite_params)
    
    
    favorite_check = Favorite.where(user_id: current_user.id, item_id: params[:item_id]).blank? 
    
    if favorite_check
      @favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end 

    # favorite = current_user.favorites.build(item_id: params[:item_id])
    # item_search_result = Item.where(name: favorite.item.name)

    
    # binding.pry
    # if favorite_check    # ユーザーにとって初めて登録する「正式品番」の場合、保存する
    #   favorite.save
    # end


  #   @favorite = Favorite.new(favorite_params)
  #   if @favorite.save
  #     # render :show
  #     puts '登録しました！'
  #   else
  #     puts '登録に失敗しました。'
  #   end 
  end

  def destroy

    binding.pry
    
    # @favorites = Favorite.where(user_id: current_user.id)

    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer


    # if favorite.present?      # favorite に 「値が存在するのか」を判定
    #   favorite.destroy
    # end

  end


  private

  def favorite_params
    # params.require(:favorite).permit(item_id: params[:item_id]).merge(user_id: current_user.id)
    params.permit(:item_id).merge(user_id: current_user.id)
  end

end
