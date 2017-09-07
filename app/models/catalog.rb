class Catalog < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :suggest_products, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  validates :sort_order, presence: true, numericality: {only_integer: true}

  scope :by_name, ->name do
    where "name LIKE ?", "%#{name}%" if name.present?
  end

  scope :order_catalogs, -> {order "sort_order"}

end
