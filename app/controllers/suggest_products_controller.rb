class SuggestProductsController < ApplicationController
  include SuggestProductsHelper
  layout "layouts/user/user_layout"
  before_action :authenticate_user!

  def new
    @suggest_product = SuggestProduct.new
  end

  def create
    if current_user.present?
      suggest_product = current_user.suggest_products.build suggest_products_params
      if suggest_product.save
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".failed"
      end
    end
    redirect_to root_path
  end

  private
  def suggest_products_params
    params.require(:suggest_product).permit :name, :description, :image, :price,
      :catalog_id
  end
end
