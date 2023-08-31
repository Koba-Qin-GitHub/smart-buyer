class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true
  validates :birthday, presence: true 

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には文字と数字の両方を入れてください'

  validates :company_id, numericality: { other_than: 1 } 




  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :company

end
