class SessionsController < ApplicationController
  layout "user/user_layout"

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = t ("messages.users.invalid_email_or_password")
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
