# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string | null: false,unique: true|
| encrypted_password | string | null: false             |
| nickname           | string | null: false             |
| family_name        | string | null: false             |
| first_name         | string | null: false             |
| family_name_kana   | string | null: false             |
| first_name_kana    | string | null: false             |
| birth_day          | date   | null: false             |


### Association

- has_many :comments
- has_many :orders
- has_many :items

## comments テーブル

| Column      | Type      | Options                       |
| ----------- | --------- | ----------------------------- |
| text        | text      | null: false                   |
| user        | references| null: false,foreign_key: true |

### Association

- belongs_to :oder
- belongs_to :item

## items テーブル

| Column              | Type      | Options                       |
| ------------------- | --------- | ----------------------------- |
| name                | string    | null: false                   |
| price               | integer   | null: false                   |
| category_id         | integer   | null: false                   |
| user                | references| null: false,foreign_key: true |
| descuription        | text      | null: false                   |
| condition_id        | integer   | null: false                   |
| postagetype_id     | integer   | null: false                   |
| preparationday_id  | integer   | null: false                   |
| placeshipment_id   | integer   | null: false                   |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## addressesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| order             | references | null: false,foreign_key: true  |
| post_code         | string     | null: false                    |
| placeshipment_id | integer    | null: false                    |
| city              | string     | null: false                    |
| address_number    | string     | null: false                    |
| building_name     |            |                                |
| phone_number      | string     | null: false                    |

### Association
- belongs_to :order


## ordersテーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| user          | references | null: false,foreign_key: true |
| item          | references | null: false,foreign_key: true |

### Association
- belongs_to :item
- has_one :address
- belongs_to :user