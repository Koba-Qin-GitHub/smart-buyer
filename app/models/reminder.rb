class Reminder < ApplicationRecord

  validates :case_id,           numericality: { other_than: 1, message: 'を選択してください' }
  validates :reminder_way_id,   numericality: { other_than: 1, message: 'を選択してください' }

  belongs_to :favorite

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :case
  belongs_to :reminder_way

end
