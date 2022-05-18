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
| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first name-kanji   | string   | null: false               |
| last name-kanji    | string   | null: false               |
| first name-kana    | string   | null: false               |
| last name-kana     | string   | null: false               |
| birthday           | datetime  | null: false               |


has_many :prototypes
has_many :purchases


# itemsテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| title              | string | null: false               |
| concept            | text   | null: false               |
| category           | string | null: false               |
| detail             | text   | null: false               |
| postage            | string | null: false               |
| origin             | string | null: false               |
| date               | datetime | null: false               |
| price              | integer | null: false               |
| user               | references | null: false, foreign_key: true |

belongs_to :user
has_one :record



# purchasesテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| title              | string | null: false               |
| price              | integer | null: false               |
| postage             | string | null: false               |
| item               | references | null: false foreign_key: true              |
| user              | references | null: false, foreign_key: true |


belongs_to :user
belongs_to :item
belongs_to :delivery




# deliveriesテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| postal code        | integer  | null: false               |
| prefecture         | string  | null: false               |
| cities/wards/towns/villages | string | null: false               |
| address              | text | null: false               |
| building-name           |　string  | null: false               |
| phone number              | integer | null: false               |
| postage              | string | null: false             |


has_many :purchases










