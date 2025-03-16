#!/usr/bin/env ruby
# This script processes environment variables and updates _config.yml accordingly
# It's meant to be run before Jekyll build in GitHub Actions

require 'yaml'

# Load current config
config_path = File.join(File.dirname(__FILE__), '_config.yml')
config = YAML.load_file(config_path)

# Process the JEKYLL_SHOW_ADS environment variable
if ENV['JEKYLL_SHOW_ADS'] == 'true'
  puts "Enabling ads based on environment variable"
  config['show_ads'] = true
else
  puts "Ads remain disabled (set JEKYLL_SHOW_ADS=true to enable)"
  config['show_ads'] = false
end

# Process ad content if provided
config['left_ad_content'] = ENV['LEFT_AD_CONTENT'] if ENV['LEFT_AD_CONTENT']
config['right_ad_content'] = ENV['RIGHT_AD_CONTENT'] if ENV['RIGHT_AD_CONTENT']

# Save the updated config
File.open(config_path, 'w') do |file|
  file.write(config.to_yaml)
end

puts "Configuration updated successfully" 