module SessionsHelper
  def clear_cart
    session.delete :cart
  end
end
