class Favorite < ApplicationRecord


  # validates :user_id
  # validates :item_id


  belongs_to :user
  belongs_to :item
  has_one    :reminder
  has_one    :favorite_item_data
  
end
