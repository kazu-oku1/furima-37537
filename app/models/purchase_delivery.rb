class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :item_id, user_id, postal_code, prefecture_id, city, address, building_name, phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. is too short"}
  end
    validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end