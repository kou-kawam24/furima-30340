class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :ship_date
  belongs_to :user
  has_many_attached :images
  has_one :order

  with_options presence: true do
    validates :images
    validates :title
    validates :text
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_area_id, numericality: { other_than: 0, message: 'Select' }
    validates :ship_date_id, numericality: { other_than: 1, message: 'Select' }
  end

  def self.search(search)
    if search != ""
      Item.where("title LIKE(?) or text LIKE(?)", "%#{search}%", "%#{search}%")
    else
      Item.all
    end
  end
end
