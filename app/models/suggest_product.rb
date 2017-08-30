class SuggestProduct < ApplicationRecord
  belongs_to :user
  belongs_to :catalog

  validates :name,  presence: true, length: {maximum: Settings.maximum.name}
  validates :price, presence: true, numericality: true
  validates :user_id, presence: true
  validates :catalog_id, presence: true
end
