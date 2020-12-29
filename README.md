# DB 設計

## users table

| Column             | Type        | Options            |
|--------------------|-------------|--------------------|
| nickname           | string      | null: false        |
| email              | string      | null: false        |
| password           | string      | null: false        |
| last_name          | string      | null: false        |
| first_name         | string      | null: false        |
| last_name_kana     | string      | null: false        |
| first_name_kana    | string      | null: false        |
| birthday           | date        | null: false        |

### Association

* has_many :items
* has_many :buyers

## items table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| title             | string     | null: false       |
| text              | text       | null: false       |
| category          | string     | null: false       |
| condition         | string     | null: false       |
| shipping_fee      | string     | null: false       |
| shipping_area     | string     | null: false       |
| shipping_days     | string     | null: false       |
| price             | integer    | null: false       |
| user              | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| card_num        | integer    | null: false       |
| exp_date        | date       | foreign_key: true |
| cvv             | integer    | foreign_key: true |
| postal_cord     | integer    | null: false       |
| prefecture      | string     | null: false       |
| city            | string     | null: false       |
| address         | string     | null: false       |
| phone_num       | integer    | null: false       |
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item