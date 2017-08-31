class Admin::SuggestProductsController < ApplicationController
  include SuggestProductsHelper
  layout "admin/admin_layout"
  before_action :authenticate_user!, :load_suggest_product,
    only: [:edit, :update, :destroy]

  def index
    @suggest_products = SuggestProduct.all.paginate page: params[:page],
      per_page: Settings.per_page.order
  end

  def edit
  end

  def update
    if @suggest_product.update_attributes suggest_products_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to request.referer
  end

  def destroy
    if @suggest_product.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to request.referer
  end

  private
  def suggest_products_params
    params.require(:suggest_product).permit :name, :description, :image, :price,
      :status
  end
  def load_suggest_product
    @suggest_product = SuggestProduct.find_by id: params[:id]
    unless @suggest_product
      flash[:danger] = t "error.suggest_product_not_found"
      redirect_to root_url
    end
  end
end
