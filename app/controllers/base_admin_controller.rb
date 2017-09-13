class BaseAdminController < ApplicationController
  layout "layouts/admin/admin_layout"
  include AuthHelper
  before_action :check_access_admin_panel
end
