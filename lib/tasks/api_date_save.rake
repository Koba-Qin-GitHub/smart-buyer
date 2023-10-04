namespace :api_data_save do
  desc "Mouser_API_データの定期取得"
  task Mouser_API_data_save: :environment do


    @favorites = Favorite.all
    
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
      @mouser_res_Price = @response_data["SearchResults"]["Parts"][0]["PriceBreaks"][0]["Price"][1..-1].delete(",")

      # 取得したデータを「favorite_item_dateテーブル」に保存
      FavoriteItemData.create(favorite_id: favorite.id, stock: @mouser_res_Stock, price: @mouser_res_Price)

    end
  end
end
