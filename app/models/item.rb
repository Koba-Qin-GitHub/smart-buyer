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
  def favorited_by_user?(user)
    favorites.where(user_id: user.id).exists?
  end


end
