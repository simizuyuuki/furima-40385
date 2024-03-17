class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t. text :image, null: false
      t. string :name, null: false
      t. text :description, null: false
      t. integer :category_id, null: false
      t. integer :situation_id, null: false
      t. integer :charge_id, null: false
      t. integer :prefectur_id, null: false
      t. integer :number_id, nulll: false
      t. integer :price, null: false
      t. references :user, null: false,foreign_key: true
      t.timestamps
    end
  end
end
