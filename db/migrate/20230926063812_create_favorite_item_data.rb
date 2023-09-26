class CreateFavoriteItemData < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_item_data do |t|

      t.integer    :item_quantity,    null: false
      t.references :favorite,         null: false, foreign_key: true

      t.timestamps
    end
  end
end
