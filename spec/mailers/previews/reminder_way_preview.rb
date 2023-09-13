# Preview all emails at http://localhost:3000/rails/mailers/reminder_way
class ReminderWayPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reminder_way/report
  def report
    ReminderWayMailer.report
  end

end
