class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception
  before_action :load_catalog
  include SessionsHelper

  def self.default_url_options
    {locale: I18n.locale}
  end

  private

  def layout_by_resource
    "user/user_layout"
  end

  before_action :create_cart

  def create_cart
    @cart = Cart.build_from_hash session[:cart]
  end

  def update_cart
    session[:cart] = @cart
  end

  def load_catalog
    @catalogs = Catalog.all
  end

  def show_index index
    current_page = params[:page].nil? ? 0 : params[:page].to_i - 1
    current_page * Settings.per_page.num_row_per_page + index + 1
  end
end
