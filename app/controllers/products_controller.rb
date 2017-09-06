class ProductsController < ApplicationController
  include ProductsHelper
  layout "user/user_layout"
  before_action :load_product, only: :show

  def index
    @products = Product.sort_price(params[:sort_price])
      .sort_name(params[:sort_name]).sort_qty(params[:sort_qty])
      .paginate page: params[:page], per_page: Settings.per_page.product
  end

  def show
    @product.update_attributes viewed: (@product.viewed + 1)
    save_recently_view if current_user.present?
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "products.not_found"
      redirect_to root_url
    end
  end

  def save_recently_view
    recently_viewed = current_user.recently_vieweds.find_by_product_id @product.id
    unless recently_viewed
      recently_viewed = current_user.recently_vieweds.build product_id: @product.id
      if recently_viewed.save
        if current_user.recently_vieweds.count > Settings.default.recently
          RecentlyViewed.destroy current_user.recently_vieweds.first
        end
      else
        flash[:danger] = recently_viewed.errors.full_messages
        redirect_to root_url
      end
    end
  end
end
