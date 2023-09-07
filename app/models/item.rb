class Item < ApplicationRecord


  validates :name,           presence: true
  # validates :content,        presence: true
  # validates :price,          presence: true
  # validates :quantity,       presence: true
  validates :user_id,        presence: true



  belongs_to :user
  # has_one :favorite
  # has_many :item_sites


end
