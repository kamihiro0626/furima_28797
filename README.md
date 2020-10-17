# README
![furima](https://user-images.githubusercontent.com/69024430/96328717-0d9ab380-1081-11eb-8713-2a13cfbda195.jpg)


# 概要
フリマクローンサイト

# URL
 http://3.114.40.91/

# 機能一覧
- ユーザー管理機能
- 商品出品機能(Active Storage)
- 商品一覧表示機能
- 商品詳細表示機能
- 商品情報編集機能
- 商品削除機能
- 商品購入機能
- BASIC認証の導入
- EC2
- エラーハンドリングの日本語化
- S3への保存

# 環境・使用技術

### フロントエンド
* Bootsnap 1.4.2
* SCSS (BEM)
* JavaScript

### バックエンド
* Ruby 2.6.5
* Rails 6.0.0

### 開発環境
* MySQL2

### 本番環境
* AWS(EC2,S3)
* MySQL2
* Nginx、 Puma

### その他使用技術
* 非同期通信（販売手数料、販売利益、プレビュー表示）
* devise (ログイン・ログアウト機能)
* Pay.jp（クレジット決済機能）
* Rubocop-airbnb
* チーム開発を意識したGitHubの活用 （プルリクエスト、イシュー、マージ）

### テスト
Rspec（単体）


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
| birthday              | date        | null: false                        |

### Association

- has_many :items
- has_many :item_purchases

## items テーブル

| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| content             | text       | null: false                    |
| category            | integer    | null: false                    |
| status              | integer    | null: false                    |
| shipping_fee_burden | integer    | null: false                    |
| shipping_origin     | integer    | null: false                    |
| shipping_day        | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image
- has_one :item_purchase

## item_purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Colum         | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| telephpne     | string     | null: false                    |
| item_purchase | references | null: false, foreign_key: true |

### Association

- belongs_to :item_purchase
