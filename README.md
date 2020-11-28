# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false ,unique: true |
| email               | string | null: false ,unique: true |
| encrypted_password  | string | null: false               |
| family_name         | string | null: false               |
| first_name          | string | null: false               |
| family_name_kana    | string | null: false               |
| first_name_kana     | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| name                 | string     | null: false       |
| introduction         | text       | null: false       |
| price                | integer    | null: false       |
| condition_id    　　　| integer    | null: false       |
| postage_payer_id     | integer    | null: false       |
| prefecture_code_id   | integer    | null: false       |
| preparetion_day_id   | integer    | null: false       |
| category_id          | integer    | null: false       |
| user                 | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル
| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| item              | references | foreign_key: true |
| user              | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :adress


## adresses テーブル

| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| post_code            | string     | null: false       |
| prefecture_code_id   | integer    | null: false       |
| city                 | string     | null: false       |
| house_number         | string     | null: false       |
| building_name        | string     |                   |
| phone_number         | string     | null: false       |
| oder                 | references | foreign_key: true |


### Association

- belongs_to :order



