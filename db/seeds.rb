image_dir = Rails.root.join('public', 'photos')

if Dir.exist?(image_dir)
  image_files = Dir[image_dir.join('*.{jpg,jpeg,png}')]

  image_files.each do |image_path|
    photo = Photo.new(
      title: File.basename(image_path, '.*'),
      description: "Descrição para #{File.basename(image_path, '.*')}",
      image: File.open(image_path)
    )
    if photo.save
      puts "Photo '#{photo.title}' added successfully!"
    else
      puts "Error adding '#{photo.title}'"
    end
  end
else
  puts "Not found!"
end
