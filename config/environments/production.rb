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

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.year.to_i}"
  }

  # Compress CSS using a preprocessor.
  config.assets.css_compressor = nil
  config.assets.js_compressor = nil

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true
  config.assets.digest = true

  # Store uploaded files on the local file system
  config.active_storage.service = :local

  # Force all access to the app over SSL, use Strict-Transport-Security
  config.force_ssl = true

  # Include generic and useful information about system operation, but avoid logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII).
  config.log_level = :info

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different logger for distributed setups.
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.logger.formatter = config.log_formatter

  # Enable locale fallbacks for I18n
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.cache_store = :redis_cache_store, {
    url: ENV['REDIS_URL'],
    driver: :hiredis,
    expires_in: 1.day
  }

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

  config.action_mailer.default_url_options = { host: 'istanbultesisat.com' }

  config.action_controller.asset_host = 'https://your-cdn.com'
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=31536000',
    'X-Content-Type-Options' => 'nosniff',
    'X-Frame-Options' => 'DENY',
    'X-XSS-Protection' => '1; mode=block'
  }

  # Activer la compression Brotli
  config.middleware.use Rack::Brotli
  
  # Compression des assets
  config.assets.compress = true
  config.assets.js_compressor = :terser
  config.assets.css_compressor = :sass

end
