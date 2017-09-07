class Admin::ProductsController < BaseAdminController
  include ProductsHelper
  before_action :load_product, only: [:destroy, :update, :edit]

  def new
    @product = Product.new
  end

  def show; end

  def index
    @products = Product.by_name(params[:search]).paginate(page: params[:page],
      per_page: Settings.per_page.product)
  end

  def create
    if current_user.products.build product_params
      flash[:success] = t "admin.products.create.create_success"
    else
      flash[:danger] = t "admin.products.create.create_fail"
    end
    redirect_to request.referer
  end

  def edit; end

  def destroy
    if @product.destroy
      flash[:success] = t "admin.products.delete.product_delete"
    else
      flash[:danger] = t "admin.products.delete.product_fails"
    end
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "admin.products.update.update_success"
    else
      flash[:danger] = t "admin.products.update.update_fail"
    end
    redirect_to request.referer
  end

  def import
    Product.import(params[:file], current_user)
    redirect_to request.referer, notice: t("admin.products.import.import_success")
  end

  private
  def product_params
    params.require(:product).permit :name, :qty,
      :tag, :catalog_id
  end

  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "admin.products.general.product_not_found"
      redirect_to request.referer
    end
  end

end
