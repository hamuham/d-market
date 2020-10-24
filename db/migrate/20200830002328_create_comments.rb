class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table   :comments do |t|
      t.text       :comment, null: false
      t.integer :user, null: false, foreign_key: true
      t.integer :item, null: false, foreign_key: true
      t.timestamp  :created_at, null: false
      t.timestamps
    end
  end
end
