class PagesController < ApplicationController
  layout "layouts/user/user_layout"
  def index

  end

  def page
    # render html: params[:pagename]
    @static_page = StaticPage.find_by key: params[:pagename]
    if !@static_page
      @content = t("pages.updating_information")
    else
      @content = @static_page.value
    end
  end
end
