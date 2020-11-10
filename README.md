# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| last_name_kana     | string   | null: false |
| first_name_kana    | string   | null: false |
| birthday           | datetime | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | text       | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| postage_id   | integer    | null: false                    |
| region_id    | integer    | null: false                    |
| ship_date_id | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belogs_to :user
- has_one   :purchase_record

## purchase_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| block           | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record