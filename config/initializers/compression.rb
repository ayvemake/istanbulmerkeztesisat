Rails.application.configure do
  # Utiliser Brotli pour la compression si disponible
  config.middleware.insert_after ActionDispatch::Static, Rack::Brotli, quality: 11

  # Utiliser Deflate comme fallback
  config.middleware.use Rack::Deflater
end 