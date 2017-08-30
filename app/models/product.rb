class Product < ApplicationRecord
  belongs_to :user
  belongs_to :catalog
  has_many :order_details, dependent: :destroy
  has_many :price_products, dependent: :destroy
  has_many :discount_products, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :recently_vieweds, dependent: :destroy

  validates :name,  presence: true, length: {maximum: Settings.maximum.name}
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :catalog_id, presence: true
end
