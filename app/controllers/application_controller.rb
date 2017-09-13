class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception
  before_action :load_catalog
  include SessionsHelper
  before_action :create_cart

  def self.default_url_options
    {locale: I18n.locale}
  end

  private

  def layout_by_resource
    "user/user_layout"
  end

  def create_cart
    @cart = Cart.build_from_hash session[:cart]
  end

  def update_cart
    session[:cart] = @cart
  end

  def load_catalog
    @catalogs = Catalog.all
  end

end
