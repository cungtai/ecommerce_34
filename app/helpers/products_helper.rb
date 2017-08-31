module ProductsHelper

  def empty_image
    ActionController::Base.helpers.asset_path ("empty_avatar.png")
  end

  def sort_options
      list = Hash.new
      list[:asc] = t "sort_asc"
      list[:desc] = t "sort_desc"
      list.map {|key, value| [value, key]}
  end

  def show_index_p index
    current_page = params[:page].nil? ? 0 : params[:page].to_i - 1
    current_page * Settings.per_page.product + index + 1
  end

end
