class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum status: {ready: 0, not_ready: 1}
end
