source 'https://rubygems.org'

# Spécifiez explicitement la version de Ruby
ruby '3.2.2'

# Rails et dépendances de base
gem 'puma', '>= 5.0'
gem 'rack-cors'
gem 'rails', '~> 8.0.1'

# Base de données
group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'sqlite3', '~> 1.4'
end

group :production do
  gem 'pg', '~> 1.5' # Spécifiez une version pour PostgreSQL
  gem 'rails_serve_static_assets'
end

# Environment variables
gem 'dotenv-rails'

# Gems essentiels
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'propshaft'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

# Frontend
gem 'hotwire-rails'
gem 'tailwindcss-rails', '~> 3.3'

# Image processing
gem 'image_processing'
gem 'mini_magick'

# Authentification et Autorisation
gem 'devise'
gem 'pundit'

# Performance et Cache
gem 'hiredis'
gem 'rack-brotli'
gem 'redis'

# SEO et API
gem 'json'
gem 'rest-client'
gem 'sitemap_generator'

group :development do
  # Outils d'analyse de code
  gem 'brakeman'
  gem 'code_metrics'      # Autre alternative pour l'analyse de code
  gem 'debride'           # Pour trouver le code mort
  gem 'rack-mini-profiler'
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'traceroute'
  gem 'unused'            # Alternative à dead_code
end
