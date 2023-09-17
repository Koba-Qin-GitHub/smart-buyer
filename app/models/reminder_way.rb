class ReminderWay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '半導体メーカー' },

  ]

  include ActiveHash::Associations
  has_many :reminders

  end