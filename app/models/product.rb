class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  belongs_to :user
  belongs_to :catalog
  has_many :order_details, dependent: :destroy
  has_many :price_products, dependent: :destroy
  has_many :discount_products, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :recently_vieweds, dependent: :destroy

  validates :name,  presence: true, length: {maximum: Settings.maximum.name}
  validates :qty, presence: true, numericality: {only_integer: true}
  validates :catalog_id, presence: true

  scope :sort_price, -> type {order current_price: type if type.present?}
  scope :sort_name, -> type {order name: type if type.present?}
  scope :sort_qty, -> type {order qty: type if type.present?}

  def main_image
    return if images.where("is_primary", true).first
    Settings.default.product.image_empty
  end

end
