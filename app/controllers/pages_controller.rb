class PagesController < ApplicationController
  layout "layouts/user/user_layout"
  def index
    @top_order_products = Product.top_order_products
      .take(Settings.default.product.top_order_products)

    if current_user.present?
      @recently_view_products = current_user
        .recently_vieweds.limit(Settings.default.product.recently_view_products)
        .map {|rv| rv.product}
    end
  end

  def page
    @static_page = StaticPage.find_by key: params[:pagename]
    if !@static_page
      @content = t("pages.updating_information")
    else
      @content = @static_page.value
    end
  end

end
