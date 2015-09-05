require File.expand_path('../config/environment', __FILE__)

if ENV['RACK_ENV'] == 'development'
  puts 'raise development mode'
end

run Hero::App.instance
