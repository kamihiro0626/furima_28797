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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :profiel
- has_one :creditcard
- has_one :buyer

## profiels テーブル

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
| user_id               | referencese | null: false, foreign_key: true     |

### Association

- belongs_to :user

## items テーブル

| Colum    | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| image    | string     | null: false                    |
| content  | string     | null: false                    |
| category | string     | null: false                    |
| status   | string     | null: false                    |
| price    | integer    | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| tel         | string     | null: false                    |
| buyer_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer

## creditcards テーブル

| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| buyer_id   | references | null: false, foreign_key: true |
| number     | integer    | null: false                    |
| expiration | integer    | null: false                    |
| security   | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :buyer