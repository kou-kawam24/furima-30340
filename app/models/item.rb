class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,  presence: true
  validates :title,  presence: true
  validates :text,   presence: true
  validates :price,  presence: true
end
