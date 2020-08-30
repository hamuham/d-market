class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,               null: false
      t.integer    :price,	            null: false
      t.integer :brand,		          foreign_key: true
      # t.references :brand,		          foreign_key: true
      t.integer    :item_condition_id,	null: false
      t.integer    :postage_payer_id,		null: false
      t.integer    :prefecture_id,		  null: false
      t.integer    :size_id,		        null: false, foreign_key: true
      t.integer    :postage_type_id,		null: false
      t.integer :category,		        null: false, foreign_key: true
      # t.references :category,		        null: false, foreign_key: true
      t.string     :trading_status,		  null: false
      t.integer :seller,		          null: false, foreign_key: true
      t.integer :buyer,		          foreign_key: true
      # t.references :seller,		          null: false, foreign_key: true
      # t.references :buyer,		          foreign_key: true
      t.integer    :preparation_day_id,	null: false
      t.timestamps
    end
  end
end