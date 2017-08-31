class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  has_many :order_details, dependent: :destroy

  enum status: {created: Settings.default.order.created, waiting: Settings.default.order.waiting,
    finished: Settings.default.order.finished}

  scope :by_receiver_name, -> receiver_name do
    where "receiver_name like ?", "%#{receiver_name}%" if receiver_name.present?
  end

  def total_price
    total = 0
    order_details.each do |od|
      total = total + od.total_price
    end
    return total
  end
end
