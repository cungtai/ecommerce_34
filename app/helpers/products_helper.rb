module ProductsHelper

  def main_image images
    images.each do |image|
      return image if image.is_primary?
    end
    empty_image
  end

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
