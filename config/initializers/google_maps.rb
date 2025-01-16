Rails.application.config.after_initialize do
  Rails.application.config.x.google_maps = {
    api_key: ENV['GOOGLE_MAPS_API_KEY']
  }
end 