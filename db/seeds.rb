image_dir = Rails.root.join('public', 'photos')

if Dir.exist?(image_dir)
  image_files = Dir[image_dir.join('*.{jpg,jpeg,png,gif,cr2}')]

  image_files.each do |image_path|
    photo = Photo.new(
      image: File.open(image_path)
    )

    if photo.save
      puts "Photo '#{photo.title}' addded successfully!"
    else
      puts "Error adding '#{photo.title}': #{photo.errors.full_messages.join(", ")}"
    end
  end
else
  puts "Not found!"
end
