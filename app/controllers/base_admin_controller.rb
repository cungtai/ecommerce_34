class BaseAdminController < ApplicationController
  layout "layouts/admin/admin_layout"
  def all_payments
    Payment.all.map{|p| [p.name,p.id]}
  end
end
