class Admin::ProductsController < ApplicationController
  before_action :verify_admin
  before_action :load_product, only: :destroy

  def new
    @product = Product.new
  end

  def index
    @products = Product.find_product_order.paginate
      per_page: Settings.per_page.suggest, page: params[:page]
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "admin.products.create.create_product_success"
    else
      flash[:danger] = t "admin.products.create.create_product_fail"
    end
    redirect_to request.referer
  end

  def edit
  end

  def destroy
    if @product.destroy
      flash[:success] = t "admin.products.delete.product_delete"
    else
      flash[:danger] = t "admin.products.delete.product_fails"
    end
    redirect_to request.referer
  end

  private
  def product_params
    params.require(:product).permit :name, :description, :image, :quantity,
      :price, :category_id
  end

  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "admin.products.general.product_not_found"
      redirect_to request.referer
    end
  end
end
