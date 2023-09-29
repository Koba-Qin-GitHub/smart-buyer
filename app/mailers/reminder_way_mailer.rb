class ReminderWayMailer < ApplicationMailer

  def report(user, item, reminder, old_stock, new_stock)
    @user = user
    @item = item
    @reminder = reminder
    @new_stock = new_stock
    @old_stock = old_stock
    delivery_options = {user_name: ENV['OWNER_MAIL_ADDRESS'], password: ENV['OWNER_MAIL_PASSWORD']}
    mail to: @user.email,
        subject: "【Smart-Buyer】「#{@item.name}」在庫状況変化によるリマインド通知"
  end
end
