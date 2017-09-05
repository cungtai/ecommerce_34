class RegistersController < ApplicationController
  layout "user/user_layout"
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "messages.register.success"
      log_in @user
    else
      flash[:danger] = t "messages.register.failed"
      render :new
    end
  end
  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
