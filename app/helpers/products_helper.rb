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

end
