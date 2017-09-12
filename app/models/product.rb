class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  belongs_to :user
  belongs_to :catalog
  has_many :order_details, dependent: :destroy
  has_many :price_products, dependent: :destroy
  has_many :discount_products, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :recently_vieweds, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :name,  presence: true, length: {maximum: Settings.maximum.name}
  validates :qty, presence: true, numericality: {only_integer: true}
  validates :catalog_id, presence: true

  scope :sort_price, -> type {order current_price: type if type.present?}
  scope :sort_name, -> type {order name: type if type.present?}
  scope :sort_qty, -> type {order qty: type if type.present?}

  scope :by_name, ->name do
    where "name LIKE ?", "%#{name}%" if name.present?
  end

  scope :order_products, -> {order "created_at desc"}

  def self.import(file, user)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(Settings.default.product.row_header)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user.products.create! row.to_hash
    end
  end

  scope :top_order_products, -> {order "number_of_order desc"}

  def primary_image
    return if images.where("is_primary", true).first
    Settings.default.product.empty_image
  end

  def list_users_rated_product
    User.of_ids Rating.user_ids_by_product self.id
  end

  def rated_by? user
    self.list_users_rated_product.include? user
  end

  def average_rate
    ((ratings.to_a.sum {|item| item.score}).to_f/ratings.count).
      round(Settings.default.round)
  end

end
