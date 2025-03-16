#!/usr/bin/env ruby
# process_images.rb - A script to optimize and process images for Jekyll blog
# Requires: ImageMagick (convert command)
# Usage: ruby process_images.rb path/to/image.jpg [width]

require 'fileutils'

def check_requirements
  unless system("which convert > /dev/null 2>&1")
    puts "Error: ImageMagick is not installed."
    puts "Please install it first:"
    puts "  - Ubuntu/Debian: sudo apt-get install imagemagick"
    puts "  - macOS: brew install imagemagick"
    puts "  - Windows: https://imagemagick.org/script/download.php"
    exit 1
  end
end

def process_image(image_path, target_width = 800)
  # Validate image existence
  unless File.exist?(image_path)
    puts "Error: Image file not found: #{image_path}"
    exit 1
  end

  # Create assets/images directory if it doesn't exist
  img_dir = "assets/images"
  FileUtils.mkdir_p(img_dir)

  # Get the basename and create target path
  basename = File.basename(image_path)
  target_path = File.join(img_dir, basename)
  
  # Copy original to assets if not already there
  unless image_path == target_path
    FileUtils.cp(image_path, target_path)
    puts "Copied original image to: #{target_path}"
  end

  # Generate a thumbnail version
  thumb_name = File.join(img_dir, "thumb-#{basename}")
  system("convert #{target_path} -resize #{target_width}x -quality 85 -strip #{thumb_name}")
  
  if $?.success?
    original_size = File.size(target_path)
    thumb_size = File.size(thumb_name)
    reduction = ((original_size - thumb_size).to_f / original_size * 100).round(2)
    
    puts "Created optimized thumbnail: #{thumb_name}"
    puts "Original size: #{original_size / 1024}KB"
    puts "Thumbnail size: #{thumb_size / 1024}KB"
    puts "Reduction: #{reduction}%"
    
    # Generate Markdown for both images
    puts "\nMarkdown for original image:"
    puts "![#{basename.gsub(/\.\w+$/, '')}](/#{target_path})"
    
    puts "\nMarkdown for thumbnail (with link to full size):"
    puts "[![#{basename.gsub(/\.\w+$/, '')}](/#{thumb_name})](/#{target_path})"
  else
    puts "Error: Failed to process image."
  end
end

# Main execution
check_requirements

if ARGV.empty?
  puts "Usage: ruby process_images.rb path/to/image.jpg [width]"
  puts "The script will:"
  puts "  1. Copy the image to assets/images/"
  puts "  2. Create an optimized thumbnail version"
  puts "  3. Output Markdown code for including the images in your posts"
  exit 1
end

image_path = ARGV[0]
target_width = ARGV[1] ? ARGV[1].to_i : 800

process_image(image_path, target_width) 