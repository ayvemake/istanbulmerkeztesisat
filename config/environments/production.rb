require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings de base
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  
  # Cache et sessions
  config.cache_store = :memory_store, { size: 64.megabytes }
  config.session_store :cookie_store, key: "_#{Rails.application.class.module_parent_name.downcase}_session"
  config.action_controller.perform_caching = true

  # Sécurité
  config.force_ssl = true
  config.require_master_key = false
  config.secret_key_base = ENV['SECRET_KEY_BASE']
  config.hosts = (ENV['ALLOWED_HOSTS'] || '').split(',')
  config.hosts.clear # Temporaire

  # Assets et CDN
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = false
  config.assets.digest = true
  config.assets.version = '1.0'
  config.action_controller.asset_host = ENV['ASSET_HOST']
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=31536000',
    'X-Content-Type-Options' => 'nosniff',
    'X-Frame-Options' => 'DENY',
    'X-XSS-Protection' => '1; mode=block'
  }

  # Compression
  config.middleware.use Rack::Deflater
  config.middleware.use Rack::Brotli
  config.assets.compress = true
  config.assets.js_compressor = :terser
  config.assets.css_compressor = nil

  # Logging
  config.log_level = :info
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::Logger.new(STDOUT) if ENV["RAILS_LOG_TO_STDOUT"].present?

  # Email
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'istanbulmerkeztesisat.com',
    user_name:            ENV['SMTP_USERNAME'],
    password:             ENV['SMTP_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true
  }

  config.action_mailer.default_url_options = { 
    host: 'www.istanbulmerkeztesisat.com',
    protocol: 'https'
  }

  # I18n
  config.i18n.fallbacks = true
  
  # Autres
  config.active_support.report_deprecations = false

  # Forcer SSL
  config.force_ssl = true
  
  # Configurer les hôtes autorisés
  config.hosts << 'www.istanbulmerkeztesisat.com'
  config.hosts << 'istanbulmerkeztesisat.com'
end
