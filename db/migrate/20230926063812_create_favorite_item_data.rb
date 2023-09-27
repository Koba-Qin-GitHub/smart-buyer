class CreateFavoriteItemData < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_item_data do |t|

      t.integer    :stock,      null: false
      t.float      :price,      null: false
      t.references :favorite,   null: false, foreign_key: true

      t.timestamps
    end
  end
end
