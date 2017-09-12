class SuggestProductUploader < CarrierWave::Uploader::Base
  permissions 0777
  include CarrierWave::MiniMagick
  process resize_to_limit: [400, 400]

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
     ActionController::Base.helpers.asset_path ([version_name,"empty_avatar.png"].compact.join("_"))
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
