class SuggestProduct < ApplicationRecord
  mount_uploader :image, SuggestProductUploader
  belongs_to :user
  belongs_to :catalog

  enum status: {waiting: Settings.default.order.waiting,
    finished: Settings.default.order.finished}

  validates :name,  presence: true, length: {maximum: Settings.maximum.name}
  validates :price, presence: true, numericality: true
  validates :user_id, presence: true

  scope :waiting_products, -> {where "status = ?", Settings.default.order.waiting}
end
