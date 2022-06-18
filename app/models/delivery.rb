class Delivery < ApplicationRecord
  # belongs_to_active_hash :prefecture_id
  belongs_to :purchase
end
