# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| email            | string | null: false |
| password         | string | null: false |
| nickname         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| birth_year       | string | null: false |
| birth_month      | string | null: false |
| birth_day        | string | null: false |

### Association

- has_many :comments
- has_many :items

## comments テーブル

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| text        | text      | null: false |
| user        | reference | null: false |

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| name             | string    | null: false |
| price            | string    | null: false |
| category         | string    | null: false |
| user             | reference | null: false |
| descuription     | text      | null: false |
| condition        | string    | null: false |
| postage_type     | string    | null: false |
| preparation_day  | string    | null: false |
| place_shipment   | string    | null: false |

### Association

- belongs_to :user
- belongs_to :destination
- has_many :comments

## destinationsテーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| user          | reference | null: false |
| post_code     | string    | null: false |
| prefecture    | string    | null: false |
| city          | reference | null: false |
| address       | string    | null: false |
| building_name |           |             |
| phone_number  | string    | null: false |


### Association

- belongs_to :card
- has_many :items

## credit_cardsテーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| user        | integer   | null: false, foreign_key: true |
| customer_id | string    | null: false                    |
| card_id     | string    | null: false                    |