class ReminderWayMailer < ApplicationMailer

  def report(reminder)
    @reminder = reminder
    delivery_options = {user_name: ENV['OWNER_MAIL_ADDRESS'], password: ENV['OWNER_MAIL_PASSWORD']}
    mail to: ENV['GUEST_MAIL_ADDRESS'],
        subject: "リマインドの登録情報"
  end
end
