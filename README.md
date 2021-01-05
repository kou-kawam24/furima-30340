# DB 設計

## users table

| Column               | Type        | Options                   |
|----------------------|-------------|---------------------------|
| nickname             | string      | null: false               |
| email                | string      | null: false, unique:true  |
| encrypted_password   | string      | null: false               |
| last_name            | string      | null: false               |
| first_name           | string      | null: false               |
| last_name_kana       | string      | null: false               |
| first_name_kana      | string      | null: false               |
| birthday             | date        | null: false               |

### Association

- has_many :items
- has_many :orders

## items table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| title              | string     | null: false       |
| text               | text       | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| shipping_fee_id    | integer    | null: false       |
| shipping_area_id   | integer    | null: false       |
| ship_date_id       | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| postal_cord     | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| address         | string     | null: false       |
| building        | string     |                   |
| phone_num       | string     | null: false       |
| order           | references | foreign_key: true |

### Association

- belongs_to :order