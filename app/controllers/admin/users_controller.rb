class Admin::UsersController < BaseAdminController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :load_user, only: [:edit, :update, :destroy]

  def index
    @users = User.by_name(params[:search]).paginate page: params[:page],
      per_page: Settings.per_page.users
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_new_params
    if @user.save
      flash[:succes] = t "success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "danger"
      redirect_to request.referrer
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "success"
    else
      flash[:danger] = t "failed"
    end
    redirect_to request.referer
  end

  def destroy
    if @user.destroy
      flash[:success] = t "admin.pages.show_users.user_deleted"
    else
      flash[:danger] = t "admin.pages.show_users.user_not_found"
    end
    redirect_to request.referer
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    if @user.blank?
      flash[:danger] = t "admin.pages.show_users.user_not_found"
      redirect_to request.referer
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :phone, :address, :avatar, :role
  end

  def user_new_params
    params.require(:user).permit :name, :email, :password, :role
  end

end
