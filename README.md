# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_hurigana     | string | null: false |
| last_hurigana      | string | null: false |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| date_of_birth      | date   | null: false |

### Association

- has_many :items
- has_many :records

## items テーブル

| Column         | Type   | Options     |
| ------         | ------ | ----------- |
| name           | string | null: false |
| description    | text   | null: false |
| category_id    | integer| null: false |
| situation_id   | integer| null: false |
| charge_id      | integer| null: false |
| source_id      | integer| null: false |
| number_id      | integer| null: false |
| price          | integer| null: false |
| user           | references| null: false, foreign_key: true|


### Association

- has_one :record
- belong_to :user

## ship_addresses テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectur        | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone        | string     | null: false                    |
| record           | references | null: false,  foreign_key: true| 

### Association

- belongs_to :ship_address
- belongs_to :record

# records テーブル

| Column          | Type       | Options                        |
| ------          | ---------- | ------------------------------ |
| item            | references | null: false,  foreign_key: true|
| user            | references | null: false,  foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one    :ship_address

