class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true
  validates :birthday, presence: true 

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字、半角数字の両方を入れてください', if: :password_required?       # パスワードの入力無しでユーザー情報を編集できる記述

  validates :company_id, numericality: { other_than: 1, message: 'を選択してください' }




  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :company



has_many :items
has_many :favorites
# has_many :sites

end
