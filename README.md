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
| birth_date         | date    | null: false |

### Association

- has_many :purchase_records
- has_many :items
- has_many :comments

## items テーブル

| Column            | Type       | Options                        |
| ------------------| -----------| ------------------------------ |
| name              | string     | null: false                    |
| detail            | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| shipping_fee_id   | integer    | null: false                    |
| shipping_place_id | integer    | null: false                    |
| shipping_days_id  | integer    | null: false                    |
| cost              | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record
- has_many :comments

## shipping_addresses テーブル

| Column              | Type       | Options                        |
| --------------------| -----------| ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city_town_villages  | string     | null: false                    |
| house_num           | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| purchase_record     | references | null: false, foreign_key: true |

### Association  

- belongs_to :purchase_record

## purchase_record テーブル

| Column              | Type       | Options                        |
| --------------------| -----------| ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association


- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## comments テーブル

| Column  | Type       | Options                        |
| --------| -----------| ------------------------------ |
| text    | string     | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Associatio
- belongs_to :item
- belongs_to :user