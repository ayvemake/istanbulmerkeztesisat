require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile
Bundler.require(*Rails.groups)

module ServiceWeb
  class Application < Rails::Application
    # Configuration de base
    config.load_defaults 7.1

    # Configuration pour Heroku
    config.assets.initialize_on_precompile = false
    config.serve_static_assets = true

    # Configuration de la locale
    config.i18n.default_locale = :tr
    config.i18n.available_locales = %i[tr en]

    # Configuration du fuseau horaire
    config.time_zone = 'Istanbul'

    # Configuration des assets
    config.assets.paths << Rails.root.join('app', 'assets', 'images', 'images')
    config.assets.paths << Rails.root.join('app', 'assets', 'images', 'services', 'services', 'images', 'services',
                                           'services')

    # Configuration des hôtes autorisés
    config.hosts << 'healthcheck.railway.app'
    config.hosts << '.railway.app'
    config.hosts << ENV['RAILWAY_STATIC_URL'] if ENV['RAILWAY_STATIC_URL'].present?
    config.hosts << ENV['RAILWAY_PUBLIC_DOMAIN'] if ENV['RAILWAY_PUBLIC_DOMAIN'].present?

    config.google_maps_api_key = ENV.fetch('GOOGLE_MAPS_API_KEY', nil)

    # Configuration des assets
    config.assets.precompile += %w[*.jpg]

    # Utilisation de la compression gzip
    config.middleware.use Rack::Deflater
    config.middleware.use Rack::Brotli if defined?(Rack::Brotli)

    config.assets.compile = true if Rails.env.development?
  end
end
