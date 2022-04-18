# README

# テーブル設計

## users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| email              | string   | null: false, unique: true|
| password           | string   | null: false              |
| nick_name          | string   | null: false              |
| first_name_kanji   | string   | null: false              |
| last_name_kanji    | string   | null: false              |
| first_name_kana    | string   | null: false              |
| last_name_kana     | string   | null: false              |
| birth_date         | datetime | null: false              |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | text       | null: false                    |
| category       | string     | null: false                    |
| price          | integer    | null: false                    |
| payer          | string     | null: false                    |
| prefecture     | string     | null: false                    |
| explanation    | text       | null: false                    |
| condition      | string     | null: false                    |
| delivery_time  | string     | null: false                    |
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
| postal_code        | integer    | null: false                    |
| province           | string     | null: false                    |
| city               | string     | null: false                    |
| address_line       | string     | null: false                    |
| building           | string     |                                |
| phone_number       | integer    | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
