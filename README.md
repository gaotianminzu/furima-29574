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

| Column             | Type    | Options     |
| -------------------| ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birth_date         | integer | null: false |

### Association

- has_many :purchase_records
- has_many :items
- has_many :comments

## items テーブル

| Column            | Type       | Options                        |
| ------------------| -----------| ------------------------------ |
| item_image        | string     | null: false                    |
| item_name         | string     | null: false                    |
| item_detail       | string     | null: false                    |
| category_id       | string     | null: false                    |
| condition_id      | string     | null: false                    |
| shipping_fee_id   | string     | null: false                    |
| shipping_place_id | string     | null: false                    |
| shipping_days_id  | string     | null: false                    |
| item_cost         | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record
- has_many :comments

## shipping_addresses テーブル

| Column              | Type       | Options                        |
| --------------------| -----------| ------------------------------ |
| prefecture_id       | integer    | null: false                    |
| city_town_villages  | string     | null: false                    |
| house_num           | string     | null: false                    |
| building_name       | string     | null: false                    |
| phone_number        | string     | null: false                    |
| purchase_record     | references | null: false, foreign_key: true |

### Association  

- has_many :purchase_records

## purchase_record テーブル

| Column              | Type       | Options                        |
| --------------------| -----------| ------------------------------ |
| purchase_date       | string     | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association


- belongs_to :user
- has_one :item
- belongs_to :shipping_address

## comments テーブル

| Column  | Type       | Options                        |
| --------| -----------| ------------------------------ |
| text    | string     | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Associatio
- belongs_to :item
- belongs_to :user