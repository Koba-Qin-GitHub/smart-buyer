class ReminderWay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メールで通知する' },

  ]

  include ActiveHash::Associations
  has_many :reminders

  end