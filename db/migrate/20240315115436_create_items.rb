class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t. string :name, null: false
      t. text :description, null: false
      t. integer :category, null: false
      t. integer :situation, null: false
      t. integer :charge, null: false
      t. integer :prefectur, null: false
      t. integer :number, nulll: false
      t. integer :price, null: false
      t. references :user, null: false,foreign_key: true
      t.timestamps
    end
  end
end
