テーブル設計

## Users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| password               | string | null: false |
| password_confirmation  | string | null: false |
| last_name(kanji)       | string | null: false |
| first_name(kanji)      | string | null: false |
| last_name(kana)        | string | null: false |
| first_name(kana)       | string | null: false |
| birthday               | string | null: false |


### Association

- has_many : items
- has_many : orders

## Items テーブル

| Column       | Type           | Options                           |
| ------------ | -------------- | --------------------------------- |
| item_name    | string         | null: false                       |
| text         | text           | null: false                       |
| price        | integer        | null: false                       |
| user         | references     | null: false, foreign_key: true    |
| category     |                |                                   |
| status       |                |                                   |

### Association

- belongs_to : user
- has_one    : address

## Address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | integer    | null: false                    |
| prefecture   |            |                                |
| city         | text       | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false                    |

### Association

- has_one : item
- has_one : order

## Order テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_one    : item