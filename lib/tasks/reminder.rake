namespace :reminder do
  desc 'リマインド通知'
  task reminder_mail: :environment do

    # リマインド方法「メール通知」のデータを取得
    @reminders = Reminder.where(reminder_way_id: 2)
  
    @reminders.each do |reminder|

      favorite_id = reminder.favorite.id
      # リマインド登録しているユーザーの情報を取得
      user = User.find(Favorite.find(favorite_id).user_id) 
      # リマインド登録している商品の情報を取得
      item = Item.find(Favorite.find(favorite_id).item_id) 

      # favorite_item_dateを「最新のデータ」「最新から1つ前のデータ」を取得
      @favorite_item_data_stock = FavoriteItemData.where(favorite_id: favorite_id).order(updated_at: :desc).limit(2)

      new_stock = @favorite_item_data_stock[0].stock
      old_stock = @favorite_item_data_stock[1].stock

      if (reminder.case_id = 4 && new_stock != old_stock)
        ReminderWayMailer.report(user, item, reminder, old_stock, new_stock).deliver_now

      elsif (reminder.case_id = 2 && new_stock > old_stock) || (reminder.case_id = 3 && new_stock < old_stock)
        ReminderWayMailer.report(user, item, reminder, old_stock, new_stock).deliver_now

      else
        
      end

    end

  end
end
