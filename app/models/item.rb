class Item < ApplicationRecord
 t.string :name
 t.text :detail
 t.integer :category_id
 t.integer :condition
 t.integer :shipping_fee_id
 t.integer :shipping_place_id
 t.integer :shipping_days_id
 t.integer :shipping_days_id
 t.integer :cost
 t.references :user, foreign_key: true 
end
# | Column            | Type       | Options                        |
# | ------------------| -----------| ------------------------------ |
# | name              | string     | null: false                    |
# | detail            | text       | null: false                    |
# | category_id       | integer    | null: false                    |
# | condition_id      | integer    | null: false                    |
# | shipping_fee_id   | integer    | null: false                    |
# | shipping_place_id | integer    | null: false                    |
# | shipping_days_id  | integer    | null: false                    |
# | cost              | integer    | null: false                    |
# | user              | references | null: false, foreign_key: true |