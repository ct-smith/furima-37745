# README

# テーブル設計

## users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false              |
| nick_name          | string   | null: false              |
| first_name_kanji   | string   | null: false              |
| last_name_kanji    | string   | null: false              |
| first_name_kana    | string   | null: false              |
| last_name_kana     | string   | null: false              |
| birth_date         | date     | null: false              |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | text       | null: false                    |
| category       | integer    | null: false                    |
| price          | integer    | null: false                    |
| payer          | integer    | null: false                    |
| prefecture     | integer    | null: false                    |
| explanation    | text       | null: false                    |
| condition      | integer    | null: false                    |
| delivery_time  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase



## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| address_line       | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
