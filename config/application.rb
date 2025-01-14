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
    
    # Configuration des locales
    config.i18n.default_locale = :tr
    config.i18n.available_locales = [:tr, :en]
    
    # Configuration du fuseau horaire
    config.time_zone = 'Istanbul'
  end
end
