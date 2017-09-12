class Admin::UsersController < BaseAdminController
  before_action :authenticate_user!, :load_user, only: [:show, :destroy]

  def index
    @users = User.by_name(params[:search]).paginate page: params[:page],
      per_page: Settings.per_page.users
  end

  def show
  end

  def create
  end

  def destroy
    if @user.destroy
      flash[:success] = t "admin.pages.show_users.user_deleted"
    else
      flash[:danger] = t "admin.pages.show_users.user_not_found"
    end
    redirect_to request.referer
  end

  def load_user
    @user = User.find_by id: params[:id]
    if @user.blank?
      flash[:danger] = t "admin.pages.show_users.user_not_found"
      redirect_to request.referer
    end
  end

end
