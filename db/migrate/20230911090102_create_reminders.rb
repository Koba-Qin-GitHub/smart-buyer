class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|

      t.integer     :case_id,             null: false
      t.integer     :reminder_way_id,     null: false
      t.references  :favorite,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
