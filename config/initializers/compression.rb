Rails.application.configure do
  # Configuration de la compression Brotli
  if defined?(Rack::Brotli)
    Rails.application.config.middleware.use Rack::Brotli, quality: 11
  end

  # Utiliser Deflate comme fallback
  config.middleware.use Rack::Deflater
end 


