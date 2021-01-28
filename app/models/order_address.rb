class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture, :city, :address, :building, :phone_num

  with_options presence: true do
    validates :postal_cord, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "Input only number"}
  end

  def save
    order = Order.create
    Address.create(postal_cord: postal_cord, prefecture: prefecture, city: city, address: address, building: building, phone_num: phone_num, order_id: order.id)
  end
end