class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_user, only:[:show, :edit, :update]

  
  def show
    @items = Item.where(user_id: current_user.id)
    @favorites = Favorite.where(user_id: current_user.id)

    # マイページ遷移時に、最新の在庫状況を表示
    mouser_API_data_save_current_user

  end


  def edit

  end

  
  def update

    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end

  end


  private

    def check_user
      @user = User.find(params[:id])

      # 遷移前後のユーザーが「同一」かどうかチェック
      unless @user.id == current_user.id
        redirect_to user_path(current_user.id)
      end

    end


    def user_params
      params.require(:user).permit(:name, :email, :company_id, :birthday)
    end
    

    def mouser_API_data_save_current_user
      
      @favorites.each do |favorite|
  
        sleep(0.1)
  
        search_word = favorite.item.name
  
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
        end
  
        @mouser_res_Stock = @response_data["SearchResults"]["Parts"][0]["AvailabilityInStock"]
        @mouser_res_Price = @response_data["SearchResults"]["Parts"][0]["PriceBreaks"][0]["Price"][1..-1]
  
        # 取得したデータを「favorite_item_dateテーブル」に保存
        FavoriteItemData.create(favorite_id: favorite.id, stock: @mouser_res_Stock, price: @mouser_res_Price)
  
      end 
    end

end
