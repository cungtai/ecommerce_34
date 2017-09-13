class BaseAdminController < ApplicationController
  layout "layouts/admin/admin_layout"

  def all_payments
    Payment.all.map{|p| [p.name,p.id]}
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
end
