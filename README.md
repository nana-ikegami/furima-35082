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

## comments テーブル

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| text        | text      | null: false |
| user        | reference | null: false |

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column              | Type      | Options                       |
| ------------------- | --------- | ----------------------------- |
| name                | string    | null: false                   |
| price               | integer   | null: false                   |
| category_id         | integer   | null: false                   |
| user (fk)           | reference | null: false,foreign_key: true |
| descuription        | text      | null: false                   |
| condition_id        | integer   | null: false                   |
| postage_type_id     | integer   | null: false                   |
| preparation_day_id  | integer   | null: false                   |
| place_shipment_id   | integer   | null: false                   |

### Association

- belongs_to :user
- has_one :oder
- has_many :comments

## addressesテーブル

| Column        | Type      | Options                       |
| ------------- | --------- | ----------------------------- |
| user          | reference | null: false                   |
| post_code     | string    | null: false                   |
| prefecture    | string    | null: false                   |
| city          | string    | null: false,foreign_key: true |
| address_id    | string    | null: false                   |
| building_name |           |                               |
| phone_number  | string    | null: false                   |

### Association
- has_one :oder


## ordersテーブル

| Column        | Type      | Options                       |
| ------------- | --------- | ----------------------------- |
| user          | reference | null: false,foreign_key: true |
| item          | reference | null: false,foreign_key: true |

### Association
- belongs_to :item
- belongs_to :oder