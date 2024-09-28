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

## users テーブル

| Column               | Type   | Options                   |
| -------------------- |--------| ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| family_name_furigana | string | null: false               |
| first_name_furigana  | string | null: false               |
| birth                | date   | null: false               |


### Association

- has_many :items
- has_many :gets

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | text       | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_from_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :get

## gets テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column           | Type       | Options                           |
| ---------------- | ---------- | --------------------------------- |
| post_code        | string     | null: false                       |
| prefecture_id    | string     | null: false                       |
| city             | string     | null: false                       |
| street           | string     | null: false                       |
| building_name    | string     |                                   |
| phone_number     | string     | null: false                       |
| get_id           | references | null: false, foreign_key: true    |


### Association

- belongs_to :get