class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # mount_uploader :avatar, AvatarUploader
  has_many :recently_vieweds, dependent: :destroy
  has_many :static_pages, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :suggest_products, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: {maximum: Settings.maximum.email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.minimum.password, maximum: Settings.maximum.password}, allow_nil: true

  before_save {email.downcase!}

  scope :by_name, ->name do
    where "name LIKE ?", "%#{name}%" if name.present?
  end

end
