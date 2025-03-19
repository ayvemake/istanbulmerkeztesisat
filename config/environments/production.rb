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
  config.force_ssl = ENV['FORCE_SSL'].present?
  config.require_master_key = false
  config.secret_key_base = ENV['SECRET_KEY_BASE']

  # Assets et CDN
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = true
  config.assets.digest = true
  config.assets.version = '1.0'
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
  config.log_level = ENV['RAILS_LOG_LEVEL']&.to_sym || :debug
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::Logger.new(STDOUT) if ENV["RAILS_LOG_TO_STDOUT"].present?
  
  # Log des paramètres de requête
  config.filter_parameters += [:password, :password_confirmation]
  
  # Configuration détaillée des logs
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime}: #{severity} -- #{msg}\n"
    end
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Désactiver temporairement le cache en production pour le débogage
  config.action_controller.perform_caching = false
  config.consider_all_requests_local = true  # Afficher les erreurs détaillées

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

  # Configurer les hôtes autorisés
  if ENV['RAILS_DEVELOPMENT_HOSTS'].present?
    config.hosts = ['localhost', 'web']
  else
    config.hosts = [
      'www.istanbulmerkeztesisat.com',
      'istanbulmerkeztesisat.com'
    ]
  end

  # Configuration des assets
  config.assets.css_compressor = nil
  config.assets.js_compressor = :terser
  config.assets.compile = false
  config.assets.digest = true
  config.public_file_server.enabled = true
  config.assets.prefix = '/assets'
  config.assets.version = '1.0'
  config.serve_static_assets = true
  config.static_cache_control = 'public, max-age=31536000'

  # Configuration pour servir les fichiers statiques
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=31536000',
    'Access-Control-Allow-Origin' => '*'
  }

  # New configuration
  config.action_controller.asset_host = ENV['ASSET_HOST'] if ENV['ASSET_HOST'].present?
end
