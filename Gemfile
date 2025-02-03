source "https://rubygems.org"

# Spécifiez explicitement la version de Ruby
ruby '3.2.2'

# Rails et dépendances de base
gem "rails", "~> 7.1.0"
gem "puma", ">= 5.0"

# Base de données
group :development, :test do
  gem "sqlite3", "~> 1.4"
end

group :production do
  gem "pg", "~> 1.5"  # Spécifiez une version pour PostgreSQL
  gem 'rack-cors'
  gem 'rails_serve_static_assets'
end

# Environment variables
gem 'dotenv-rails'

# Gems essentiels
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# Frontend
gem 'hotwire-rails'
gem "tailwindcss-rails", "~> 3.3"

# Image processing
gem 'image_processing'
gem 'mini_magick'

# Authentification et Autorisation
gem 'devise'
gem 'pundit'

# Performance et Cache
gem 'redis'
gem 'hiredis'
gem 'rack-brotli'

# SEO et API
gem 'sitemap_generator'
gem 'rest-client'
gem 'json'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  # Outils d'analyse de code
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'brakeman'
  gem 'rack-mini-profiler'
  gem 'traceroute'
  gem 'rails_best_practices'
  gem 'debride'           # Pour trouver le code mort
  gem 'unused'            # Alternative à dead_code
  gem 'code_metrics'      # Autre alternative pour l'analyse de code
end
