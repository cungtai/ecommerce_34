module AuthHelper
  def check_login
    unless logged_in?
      flash[:danger] = t "login_to_continue"
      redirect_to login_path
    end
  end

  def check_access_admin_panel
    if logged_in?
      return if current_user.admin? || current_user.editor?
      flash[:danger] = t "not_permision"
      redirect_to root_path
    end
  end

end
