class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id,:item_id, :order_id, :post_code, :placeshipment_id, :city, :address_number, :building_name, :phone_number
  attr_accessor :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ } 
    validates :placeshipment_id
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(order_id: order.id, post_code: post_code, placeshipment_id: placeshipment_id, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number)
  end
end