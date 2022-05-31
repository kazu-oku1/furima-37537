class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_type
  belongs_to :prefecture
  belongs_to :preparation_day

  validates :title, :explanation, :price, :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blunk" }
  validates :condition_id, numericality: { other_than: 1, message:"can't be blunk" }
  validates :postage_type_id, numericality: { other_than: 1, message:"can't be blunk" }
  validates :prefecture_id, numericality: { other_than: 1, message:"can't be blunk" }
  validates :preparation_day_id, numericality: { other_than: 1, message:"can't be blunk" }
end
