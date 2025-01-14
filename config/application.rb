require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ServiceWeb
  class Application < Rails::Application
    # Configuration de base
    config.load_defaults 7.1
    
    # Configuration pour Heroku
    config.assets.initialize_on_precompile = false
    config.serve_static_assets = true
    
    # Configuration de la base de données
    config.active_record.verify_foreign_keys_for_fixtures = false
    
    # Configuration de la locale
    config.i18n.default_locale = :tr
    config.i18n.available_locales = [:tr, :en]
    
    # Configuration du fuseau horaire
    config.time_zone = 'Istanbul'
    
    # Ajoutez cette ligne
    config.assets.paths << Rails.root.join("app", "assets", "images")
    
    # Configuration des hôtes autorisés
    config.hosts << "healthcheck.railway.app"
    config.hosts << ".railway.app"
    config.hosts << ENV['RAILWAY_STATIC_URL'] if ENV['RAILWAY_STATIC_URL'].present?
    config.hosts << ENV['RAILWAY_PUBLIC_DOMAIN'] if ENV['RAILWAY_PUBLIC_DOMAIN'].present?
  end
end
