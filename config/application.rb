require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ServiceWeb
  class Application < Rails::Application
    # Utilisez Rails 7.1
    config.load_defaults 7.1

    # Configuration pour PostgreSQL en production
    config.active_record.schema_format = :ruby
    config.active_record.dump_schema_after_migration = false if Rails.env.production?

    # Configuration des assets
    config.assets.compile = true
    config.assets.digest = true

    # Configuration des locales
    config.i18n.default_locale = :tr
    config.i18n.available_locales = [:tr, :en]
    
    # Configuration du fuseau horaire
    config.time_zone = 'Istanbul'
  end
end
