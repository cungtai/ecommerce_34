class StaticPage < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :key, presence: true, length: { maximum: 100 }

  scope :of_ids, -> ids {where id: ids}
end
