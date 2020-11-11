# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| ----------------| ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth_y         | integer | null: false |
| birth_m         | integer | null: false |
| birth_d         | integer | null: false |

### Association

- has_one :shipping_address
- has_many :items
- has_many :comments

## items テーブル

| Column        | Type       | Options                        |
| --------------| -----------| ------------------------------ |
| item_image    | string     | null: false                    |
| item_name     | string     | null: false                    |
| item_detail   | string     | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping_fee  | integer    | null: false                    |
| shipping_place| string     | null: false                    |
| shipping_days | string     | null: false                    |
| item_cost     | string     | null: false                    |
| seller_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record
- has_many :comments

## shipping_addresses テーブル

| Column              | Type       | Options                        |
| --------------------| -----------| ------------------------------ |
| prefecture          | string     | null: false                    |
| city_town_villages  | string     | null: false                    |
| house_num           | string     | null: false                    |
| building_name       | string     | null: false                    |
| phone_number        | string     | null: false                    |
| purchaser_id        | references | null: false, foreign_key: true |

### Association

- has_many :purchase_records
- belongs_to :user


## purchase_record テーブル

| Column              | Type       | Options                        |
| --------------------| -----------| ------------------------------ |
| purchase_date       | string     | null: false                    |
| purchaser_id        | references | null: false, foreign_key: true |
| shipping_address_id | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :shipping_address
- has_one :item

## comments テーブル

| Column  | Type       | Options                        |
| --------| -----------| ------------------------------ |
| text    | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user