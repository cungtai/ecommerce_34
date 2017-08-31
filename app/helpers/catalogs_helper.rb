module CatalogsHelper
  def show_index index
    current_page = params[:page].nil? ? 0 : params[:page].to_i - 1
    current_page * Settings.per_page.catalog + index + 1
  end
end
