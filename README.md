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
- has_many :recordes

## items テーブル

| Column      | Type   | Options     |
| ------      | ------ | ----------- |
| name        | string | null: false |
| description | text   | null: false |
| category    | integer| null: false |
| situation   | integer| null: false |
| charge      | integer| null: false |
| source      | integer| null: false |
| number      | integer| null: false |
| price       | integer| null: false |
| user        | references| null: false, foreign_key: true|


### Association

- belongs_to :users
- has_many :shippings
- has_many :recods

## shippings テーブル

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
| record           | references | null: false,  foreign_key: true| 

### Association

- belongs_to :shipping
- belongs_to :recod

# records テーブル

| Column          | Type       | Options                        |
| ------          | ---------- | ------------------------------ |
| item            | references | null: false,  foreign_key: true|
| user            | references | null: false,  foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one    :shipping

