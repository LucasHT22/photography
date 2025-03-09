class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    'uploads/photos'
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end  

  version :thumb do
    process resize_to_fit: [200, 200]
  end
end
