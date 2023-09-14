class ItemsController < ApplicationController
  def index
  end
  

  def new
    gon.mouser_apiKey = ENV['MOUSER_API_KEY']
    

    @item = Item.new

    if user_signed_in?
      @favorites = Favorite.where(user_id: current_user.id)
    end
    
    # binding.pry
    
    
  end
  
  def create
    # binding.pry
    # favorite_blank_check = Favorite.where(user_id: current_user.id, item_id: Item.where(name: item_params[:name])).blank? 
    # puts "OK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    # puts favorite_blank_check

    # binding.pry
    item = Item.create(item_params)
    # render json:{ item: item }
    redirect_to item_path(item.id)

    
    
    # favorite_blank_check = Favorite.where(user_id: current_user.id, item_id: Item.where(name: item.name)).blank? 
    # gon.favorite_blank_check = favorite_blank_check

    
    # binding.pry
    
    

    # @items = Item.all
    
    
    # @item = Item.new(item_params)
    # if @item.save
    #   render json:{ item: item }
    #   # render :index, notice: '登録しました！'
    #   # render :new
    #   # redirect_to root_path, notice: '「' + @item.name + '」の検索結果'
    #   redirect_to root_path(@item)
    # else
    #   # redirect_to root_path, notice: '登録に失敗しました。'
    #   redirect_to root_path
    # end 
  end

  def show
    # binding.pry
    set_item

    gon.mouser_apiKey = ENV['MOUSER_API_KEY']
    
    # binding.pry
    gon.item = @item


  end


  private

  def item_params
    params.require(:item).permit(:name).merge(user_id: current_user.id)
    # params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipment_date_id, :image).merge(user_id: current_user.id) 
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end

end




