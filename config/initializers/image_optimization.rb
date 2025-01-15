require 'image_processing/vips'

Rails.application.configure do
  config.active_storage.variant_processor = :vips
end 