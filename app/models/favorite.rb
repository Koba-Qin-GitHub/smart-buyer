class Favorite < ApplicationRecord


  # validates :user_id
  # validates :item_id


  belongs_to :user
  belongs_to :item
  has_many :reminders
end
