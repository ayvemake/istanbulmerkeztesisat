require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  
  # Enable/disable caching. By default caching is disabled.
  config.action_controller.perform_caching = true
  
  # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
  # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
  config.require_master_key = true

  # Add this line if you want to use the key from environment variable
  config.secret_key_base = ENV['SECRET_KEY_BASE']

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.year.to_i}"
  }

  # Compress CSS using a preprocessor.
  config.assets.css_compressor = nil
  config.assets.js_compressor = nil

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false
  config.assets.digest = true

  # Force all access to the app over SSL, use Strict-Transport-Security
  config.force_ssl = true

  # Include generic and useful information about system operation, but avoid logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII).
  config.log_level = :info

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Use a different logger for distributed setups.
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.logger.formatter = config.log_formatter

  # Enable locale fallbacks for I18n
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Compression Gzip
  config.middleware.use Rack::Deflater
  
  # Cache statique
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{30.days.to_i}"
  }

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

  config.action_controller.asset_host = ENV['ASSET_HOST'] if ENV['ASSET_HOST'].present?
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=31536000',
    'Expires' => 1.year.from_now.to_formatted_s(:rfc822)
  }

  # Activer la compression Brotli
  config.middleware.use Rack::Brotli
  
  # Compression des assets
  config.assets.compress = true
  config.assets.js_compressor = :terser
  config.assets.css_compressor = :sass

  # Simplify asset configuration
  config.assets.version = '1.0'

  # Serve static files
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  
  # Logging
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.log_level = :info

  # Autoriser les hôtes depuis une variable d'environnement
  config.hosts = (ENV['ALLOWED_HOSTS'] || '').split(',')

  # Désactiver la vérification d'hôte (utiliser seulement temporairement)
  config.hosts.clear

  # Utilisation de CDN (si nécessaire)
  config.action_controller.asset_host = ENV['ASSET_HOST']

  # Active le caching des fragments
  config.action_controller.perform_caching = true

  # Cache en mémoire pour les sessions
  config.session_store :cookie_store, key: "_#{Rails.application.class.module_parent_name.downcase}_session"

  # Configuration CDN et assets
  config.action_controller.asset_host = ENV['ASSET_HOST']
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=31536000',
    'Expires' => 1.year.from_now.to_formatted_s(:rfc822)
  }

  # Compression des assets
  config.assets.compress = true
  config.assets.js_compressor = :terser
  config.assets.css_compressor = :sass

  # Cache et sessions
  config.cache_store = :memory_store, { size: 64.megabytes }
  config.session_store :cookie_store, key: "_#{Rails.application.class.module_parent_name.downcase}_session"
  config.action_controller.perform_caching = true

  # Configuration CDN et assets (supprimer les doublons)
  config.action_controller.asset_host = ENV['ASSET_HOST']
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=31536000',
    'Expires' => 1.year.from_now.to_formatted_s(:rfc822)
  }

  # Compression (supprimer les doublons)
  config.middleware.use Rack::Deflater
  config.middleware.use Rack::Brotli
  config.assets.compress = true
  config.assets.js_compressor = :terser
  config.assets.css_compressor = :sass

  # Supprimer les configurations en double
  config.assets.version = '1.0'
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Logging (garder une seule configuration)
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.log_level = :info

  # Sécurité
  config.hosts = (ENV['ALLOWED_HOSTS'] || '').split(',')
  config.hosts.clear # Temporaire
end
