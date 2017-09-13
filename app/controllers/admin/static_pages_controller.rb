class Admin::StaticPagesController < BaseAdminController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :load_staticpage, except: [:create, :new, :index]

  def index
    @search = StaticPage.search(params[:q])
    @static_pages = @search.result.paginate page: params[:page],
      per_page: Settings.per_page.num_row_per_page
  end

  def show; end

  def new
    @static_page = current_user.static_pages.new
  end

  def edit

  end

  def update
    if @static_page.update_attributes static_page_params
      flash[:success] = t "admin.staticpages.update.update_success"
    else
      flash[:danger] = t "admin.staticpages.update.update_fail"
    end
    redirect_to request.referer
  end

  def create
    @static_page = current_user.static_pages.new static_page_params
    if @static_page.save
      flash[:success] = t "admin.staticpages.create.create_success"
    else
      flash[:danger] = t "admin.staticpages.create.create_fail"
    end
    redirect_to request.referer
  end

  private
  def static_page_params
    params.require(:static_page).permit :key, :value
  end

  def load_staticpage
    @static_page = StaticPage.find_by id: params[:id]
    if @static_page.blank?
      flash[:danger] = t "admin.staticpages.index.staticpage_not_found"
      redirect_to request.referer
    end
  end

end
