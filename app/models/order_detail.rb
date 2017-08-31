class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum status: {ready: 0, not_ready: 1}

  def unit_price
    product.current_price
  end

  def total_price
    unit_price * qty
  end
end
