class CreateShipAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :ship_addresses do |t|
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :address, null: false
      t.string :building
      t.string :telephone, null:false
      t.references :record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
