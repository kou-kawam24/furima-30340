class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :ship_date
  belongs_to :user
  has_one_attached :image

  validates :image,  presence: true
  validates :title,  presence: true
  validates :text,   presence: true
  validates :price,  presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :ship_date_id, numericality: { other_than: 1 }
end
