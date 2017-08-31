module SessionsHelper
  def is_admin!
    unless current_user.role == Settings.default.role.admin
      sign_out current_user
      redirect_to root_path
    end
    return true
  end

  def clear_cart
    session.delete :cart
  end

end
