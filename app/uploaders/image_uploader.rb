class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    'uploads/photos'
  end

  def extension_allowlist
    %w[jpg jpeg gif png CR2]
  end  

  version :thumb do
    process resize_to_fit: [300, 300]
  end

  version :prev do
    process resize_to_fit: [800, 800]
  end
end
