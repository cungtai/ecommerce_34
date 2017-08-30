class UsersController < ApplicationController
  layout "user/user_layout"
  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "messages.users.user_not_found"
    redirect_to login_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "messages.register.success"
    else
      flash[:danger] = t "messages.register.failed"
    end
    redirect_to request.referer
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "messages.users.update_profile_success"
    else
      flash[:danger] = t "messages.users.update_profile_failed"
    end
    redirect_to request.referer
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :phone, :address, :password,
      :password_confirmation, :avatar
  end

  def correct_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t("messages.users.user_not_found")
      redirect_to root_path
    else
      unless @user == current_user
        flash[:danger] = t("messages.users.user_not_found")
      redirect_to root_path
      end
    end
  end
end
