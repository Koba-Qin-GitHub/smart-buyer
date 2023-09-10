class Item < ApplicationRecord


  validates :name,           presence: true
  # validates :content,        presence: true
  # validates :price,          presence: true
  # validates :quantity,       presence: true
  validates :user_id,        presence: true



  belongs_to :user
  has_many :favorites
  # has_many :item_sites



  # すでにお気に入り済みなのか、チェックする
  # def favorited_by?(user)
  #   favorites.where(user_id: user.id).exists?
  # end

  # def favorite_check
  #   favorite.where(user_id: current_user.id, item_id: item.where(name: item.name)).blank? 
  # end


end
