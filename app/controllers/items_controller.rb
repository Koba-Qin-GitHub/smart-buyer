class ItemsController < ApplicationController

  before_action :authenticate_user!, except:[:new]
  before_action :set_item, only:[:show]
  before_action :check_user, only:[:show]

  
  def index
  end
  

  def new
    @item = Item.new
  end
  

  def create
    item = Item.create(item_params)
    redirect_to item_path(item.id)
  end


  def show
    
    mouser_search
   
    if @mouser_res_NumberOfResult  == 1 

      # Mouser_APIレスポンスを各インスタンス変数へ代入
      @mouser_res_PartNumber = @response_data["SearchResults"]["Parts"][0]["ManufacturerPartNumber"]
      @mouser_res_Stock = @response_data["SearchResults"]["Parts"][0]["AvailabilityInStock"]
      @mouser_res_Image = @response_data["SearchResults"]["Parts"][0]["ImagePath"]
      @mouser_res_Manufacturer = @response_data["SearchResults"]["Parts"][0]["Manufacturer"]
      @mouser_res_Price = @response_data["SearchResults"]["Parts"][0]["PriceBreaks"][0]["Price"]
      @mouser_res_ItemUrl = @response_data["SearchResults"]["Parts"][0]["ProductDetailUrl"]

    else 
      flash[:notice] = @mouser_res_NumberOfResult.to_s + '件、ヒットしました。完全一致の「正式品番」を入力してください'
      redirect_to root_path
    end


    @favorites = Favorite.where(user_id: current_user.id)

    
  end


  

  private

  def item_params
    params.require(:item).permit(:name).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end


  def set_favorite
    @favorite = Favorite.where(user_id: current_user.id, item_id: Item.where(name: @item.name))
  end


  def check_user
    @user = User.find(Item.find(params[:id]).user.id)

    # 遷移前後のユーザーが「同一」かどうかチェック
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

  end


  def mouser_search
    search_word = @item.name

    # Mouser_API処理
    require 'net/http'
    require 'json'
    
    # URL作成
    uri = URI('https://api.mouser.com/api/v1/search/partnumber')
    params = {
      :apiKey => ENV['MOUSER_API_KEY'],
    }
    uri.query = URI.encode_www_form(params)

    # HTTPSリクエストを構築
    req = Net::HTTP::Post.new(uri)
    req.content_type = 'application/json'
    req['accept'] = 'application/json'

    req.body = {
      'SearchByPartRequest' => {
        'mouserPartNumber' => search_word,
        'partSearchOptions' => 'string'
      }
    }.to_json
    
    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    # HTTPSリクエストを送信
    res = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      response = http.request(req)
      @response_data = JSON.parse(response.body)
      @mouser_res_NumberOfResult = @response_data["SearchResults"]["NumberOfResult"].to_i
    end
  end

end




