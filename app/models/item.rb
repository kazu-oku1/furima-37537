class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  has_many :favorites
  has_many :users, through: :favorites

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_type
  belongs_to :prefecture
  belongs_to :preparation_day

  validates :title, presence: true
  validates :explanation, presence: true

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_type_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :preparation_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
