class Admin::SuggestProductsController < ApplicationController
  include SuggestProductsHelper
  layout "admin/admin_layout"
  before_action :authenticate_user!
  before_action :load_suggest_product, except: :index

  def index
    @suggest_products = SuggestProduct.waiting_products.paginate page: params[:page],
      per_page: Settings.per_page.order
  end

  def edit
  end

  def update
    if @suggest_product.update_attributes suggest_products_params
      add_suggest_to_products @suggest_product
    else
      flash[:danger] = t ".failed"
    end
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
    params.require(:suggest_product).permit :name, :description, :image, :price
  end
  def load_suggest_product
    @suggest_product = SuggestProduct.find_by id: params[:id]
    unless @suggest_product
      flash[:danger] = t "error.suggest_product_not_found"
      redirect_to root_url
    end
  end

  def add_suggest_to_products suggest_product
    product = current_user.products.build catalog_id: suggest_product.catalog_id,
      name: suggest_product.name, content: suggest_product.description,
      qty: Settings.default.quantity
    if product.save
      flash[:success] = t ".success"
      suggest_product.finished!
      redirect_to admin_suggest_products_path
    else
      flash[:danger] = t ".failed"
    end
  end
end
