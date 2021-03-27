class OrderAddress
  include ActiveModel::Model
  attr_accessor :user,:item, :order, :post_code, :placeshipment_id, :city, :address_number, :building_name, :phone_number
  
  with_options presence: true do
    validates :user
    validates :item
    validates :order
    validates :post_code
    validates :placeshipment_id
    validates :city
    validates :address_number
    validates :building_name
    validates :phone_number
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user: user, item: item)
    address = Address.create(order: order, post_code: post_code, placeshipment_id: placeshipment_id, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number)
  end
end