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
| family_name_kana     | string | null: false               |
| first_name_kana      | string | null: false               |
| birth                | date   | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_from_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column           | Type       | Options                           |
| ---------------- | ---------- | --------------------------------- |
| post_code        | string     | null: false                       |
| shipping_from_id | integer    | null: false                       |
| city             | string     | null: false                       |
| street           | string     | null: false                       |
| building_name    | string     |                                   |
| phone_number     | string     | null: false                       |
| order            | references | null: false, foreign_key: true    |


### Association

- belongs_to :order