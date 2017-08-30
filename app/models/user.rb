class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :recently_vieweds, dependent: :destroy
  has_many :static_pages, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :suggest_products, dependent: :destroy
  has_many :raitings, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: {maximum: Settings.maximum.email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.minimum.password, maximum: Settings.maximum.password}, allow_nil: true

  before_save {email.downcase!}
  has_secure_password
end
