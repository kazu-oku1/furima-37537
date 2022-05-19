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
| first_name          | string | null: false               |
| family_name         | string | null: false               |
| first_name_kana     | string | null: false               |
| family_name_kana    | string | null: false               |
| birth_day           | date   | null: false               |

### Association
has_many :items
has_many :purchases

# itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| photo              | text       | null: false                    |
| title              | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_conditions_id | integer    | null: false                    |
| postage_type_id    | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| preparation_days_id| integer    | null: false                    |
| value              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase
belongs_to_active_hash :category_id
belongs_to_active_hash :item_conditions_id
belongs_to_active_hash :postage_type_id
belongs_to_active_hash :prefectures_id
belongs_to_active_hash :preparation_days_id

# purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| item               | references | null: false foreign_key: true  |
| user               | references | null: false, foreign_key: true |
| delivery           | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
belongs_to :delivery

# deliveriesテーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| postal_code        | integer    | null: false                    |
| prefectures_id     | string     | null: false                    |
| city               | string     | null: false                    |
| address            | text       | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |  
| purchase           | references | null: false, foreign_key: true |

### Association
has_one_active_hash :prefectures_id
has_one :purchase










