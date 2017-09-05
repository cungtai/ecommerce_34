class UsersController < ApplicationController
  layout "user/user_layout"

  def show
    @user = User.find_by id: params[:id]
    @user.present?
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
      flash[:success] = t "message.users.update_profile_success"
    else
      flash[:success] = t "message.users.update_profile_failed"
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
