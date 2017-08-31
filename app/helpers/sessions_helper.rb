module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def logout
    session.delete :user_id
    @current_user = nil
  end

  def is_admin!
    unless current_user.role == Settings.default.role.admin
      sign_out current_user
      redirect_to root_path
    end
    return true
  end

end
