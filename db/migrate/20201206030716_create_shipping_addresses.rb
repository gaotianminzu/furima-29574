class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,                    null: false
      t.integer :prefecture,                    null: false
      t.string :city_town_villages,             null: false
      t.string :house_num,                       null: false
      t.string :building_name,                  null: false
      t.string :phone_number,                   null: false
      t.references :purchase_record,             null: false, foreign_key: true
      t.timestamps
    end
  end
end