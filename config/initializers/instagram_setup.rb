require "instagram"
Instagram.configure do |config|
  config.client_id = ENV["AP_ID"]
  config.client_secret = ENV["APP_SECRET"]
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end
