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

| Column                | Type        | Options                            |
| --------------------- | ----------- | ---------------------------------- |
| nickname              | string      | null: false                        |
| email                 | string      | null: false                        |
| password              | string      | null: false                        |
| password_confirmation | string      | null: false                        |
| family_name           | string      | null: false                        |
| family_name_kana      | string      | null: false                        |
| first_name            | string      | null: false                        |
| first_name_kana       | string      | null: false                        |
| birthday              | integer     | null: false                        |
| birthmonth            | integer     | null: false                        |
| birthyear             | integer     | null: false                        |

### Association

- has_many :items
- has_one :item_purchase

## items テーブル

| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| image               | string     | null: false                    |
| content             | text       | null: false                    |
| category            | string     | null: false                    |
| status              | string     | null: false                    |
| shipping_fee_burden | string     | null: false                    |
| shipping_origin     | string     | null: false                    |
| shipping_days       | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item_purchase

## item_purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Colum         | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | text       |                                |
| tel           | string     | null: false                    |
| item_purchase | references | null: false, foreign_key: true |

### Association

- belongs_to :item_purchase