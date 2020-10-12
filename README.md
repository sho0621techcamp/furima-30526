テーブル設計

## Users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| password               | string | null: false |
| last_name_kanji        | string | null: false |
| first_name_kanji       | string | null: false |
| last_name_kana         | string | null: false |
| first_name_kana        | string | null: false |
| birthday               | date   | null: false |


### Association

- has_many : items
- has_many : orders

## Items テーブル

| Column             | Type           | Options                           |
| ------------------ | -------------- | --------------------------------- |
| name               | string         | null: false                       |
| text               | text           | null: false                       |
| price              | integer        | null: false                       |
| user               | references     | null: false, foreign_key: true    |
| category_id        | integer        | null: false                       |
| status_id          | integer        | null: false                       |
| shipping_fee_id    | integer        | null: false                       |
| shipping_region_id | integer        | null: false                       |
| shipping_days_id   | integer        | null: false                       |


### Association
- has_one    : order
- belongs_to : user

## Addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key:true  |

### Association
- belongs_to : order

## Orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one    : address    