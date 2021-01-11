class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :ship_date
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :price, inclusion: { in: 300..9999999, message: 'Out of setting range' }, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_area_id, numericality: { other_than: 0, message: 'Select' }
    validates :ship_date_id, numericality: { other_than: 1, message: 'Select' }
  end
end
