class Reminder < ApplicationRecord

  belongs_to :favorite

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :case
  belongs_to :reminder_way

end
