class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  has_many :order_details, dependent: :destroy

  enum status: {waiting: Settings.default.order.waiting,
    finished: Settings.default.order.finished}

  scope :by_receiver_name, -> receiver_name do
    where "receiver_name like ?", "%#{receiver_name}%" if receiver_name.present?
  end
end
