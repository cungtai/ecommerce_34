class Admin::CatalogsController < BaseAdminController
  before_action :authenticate_user!
  before_action :is_admin!
  before_action :load_catalog, except: [:create, :new, :index]

  def index
    @catalogs = Catalog.by_name(params[:search]).order_catalogs.paginate(page: params[:page],
      per_page: Settings.per_page.catalog)
  end

  def show
  end

  def new
    @catalog = Catalog.new
  end

  def edit

  end

  def update
    if @catalog.update_attributes catalog_params
      flash[:success] = t "admin.catalogs.update.update_success"
    else
      flash[:danger] = t "admin.catalogs.update.update_fail"
    end
    redirect_to request.referer
  end

  def create
    @catalog = Catalog.new catalog_params
    if @catalog.save
      flash[:success] = t "admin.catalogs.create.create_success"
    else
      flash[:danger] = t "admin.catalogs.create.create_fail"
    end
    redirect_to request.referer
  end

  def destroy
    if @catalog.destroy
      flash[:success] = t "admin.catalogs.delete.delete_success"
    else
      flash[:danger] = t "admin.catalogs.delete.delete_fail"
    end
    redirect_to request.referer
  end

  private
  def catalog_params
    params.require(:catalog).permit :name, :sort_order
  end

  def load_catalog
    @catalog = Catalog.find_by id: params[:id]
    if @catalog.blank?
      flash[:danger] = t "admin.catalogs.index.catalog_not_found"
      redirect_to request.referer
    end
  end

end
