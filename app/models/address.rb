class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_cord, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "Input only number"}
  end
end
