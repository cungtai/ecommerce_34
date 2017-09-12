class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception
  include SessionsHelper
  def self.default_url_options
    {locale: I18n.locale}
  end

  private
  def layout_by_resource
    if devise_controller?
      "user/user_layout"
    else
      "application"
    end
  end
end
