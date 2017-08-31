class Image < ApplicationRecord
  belongs_to :product
  mount_uploader :url, ProductImageUploader

  scope :by_product, ->product_id do
    where product_id: product_id if product_id.present?
  end
end
