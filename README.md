# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| date_of_birth      | string | null: false |

### Association

- has_many :items
- has_many :shipping
- has_many :record

## items テーブル

| Column      | Type   | Options     |
| ------      | ------ | ----------- |
| name        | string | null: false |
| description | text   | null: false |
| category    | string | null: false |
| situation   | string | null: false |
| charge      | string | null: false |
| source      | string | null: false |
| number      | string | null: false |
| price       | string | null: false |
| user        | string | null: false, foreign_key: ture|


### Association

- belongs_to :users
- has_many :shipping
- has_many :recod

## shipping テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| creadit_number   | string     | null: false                    |
| creadit_expiry   | string     | null: false                    |
| creadit_security | string     | null: false                    |
| post_code        | string     | null: false                    |
| prefectur        | string     | null: false                    |
| municipaliti     | string     | null: false                    |
| addres           | string     | null: false                    |
| building         | string     | null: true                     |
| telephone        | string     | null: false                    |
| record           | regerenses | null: false,  foreign_key: ture| 

### Association

- belongs_to :users
- belongs_to :shipping
- belongs_to :recod

# record テーブル

| Column          | Type       | Options                        |
| ------          | ---------- | ------------------------------ |
| item            | references | null: false,  foreign_key: true|
| user            | referenses | null: false,  foreign_key: true|

- belongs_to :users
- belongs_to :items
- has_many   :shipping


<!--record テーブル  -->
 |   user_id  | item_id  |
 |      1     |     1    |
 |      2     |     2    |
 |      1     |     3    |

<!-- item_id 1 -->
 item.record  => record id: 1, user_id: 1, item_id: 1, created_at: 00000, updated_at: 00000
 <!-- item_id 6 -->
 item.record => []
 item.record.id => undifind method 'id' for nil:NilClass