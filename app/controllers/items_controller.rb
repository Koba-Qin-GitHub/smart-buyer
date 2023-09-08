class ItemsController < ApplicationController
  def index


  end

  def new
    gon.mouser_apiKey = ENV['MOUSER_API_KEY']

    @item = Item.new

    @items = Item.all

  end

  def create
    item = Item.create(item_params)
    render json:{ item: item }

    @items = Item.all

    # @item = Item.new(item_params)
    # if @item.save
    #   # render :show
    #   redirect_to root_path, notice: '登録しました！'
    # else
    #   redirect_to root_path, notice: '登録に失敗しました。'
    # end 
  end

  def show
    

  end


  private

  def item_params
    params.require(:item).permit(:name).merge(user_id: current_user.id)
    # params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipment_date_id, :image).merge(user_id: current_user.id) 
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  # def set_user
  #   @user = User.find(params[:id])
  # end

end




