# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# usersテーブル
| Column              | Type   | Options                   |
| ------------------  | ------ | -----------               |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| family_name         | string | null: false               |
| first_name          | string | null: false               |
| family_name_kana    | string | null: false               |
| first_name_kana     | string | null: false               |
| birth_day           | date   | null: false               |

### Association
has_many :items
has_many :purchases

# itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| title              | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| postage_type_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase
belongs_to_active_hash :category_id
belongs_to_active_hash :condition_id
belongs_to_active_hash :postage_type_id
belongs_to_active_hash :prefecture_id
belongs_to_active_hash :preparation_day_id

# purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| item               | references | null: false foreign_key: true  |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :delivery

# deliveriesテーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |  
| purchase           | references | null: false, foreign_key: true |

### Association
belongs_to_active_hash :prefecture_id
belongs_to :purchase










