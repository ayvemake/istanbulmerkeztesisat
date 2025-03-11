source 'https://rubygems.org'

# Spécifiez explicitement la version de Ruby
ruby '3.2.2'

# Rails et dépendances de base
gem 'puma', '>= 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.1.0'
gem 'pg'

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

# Performance et Cache
gem 'rack-brotli'
gem 'rack-rewrite'
gem 'rack-attack'

# Monitoring
gem 'newrelic_rpm'

# SEO et API
gem 'json'
gem 'rest-client'
gem 'sitemap_generator'

group :development do
  # Outils d'analyse de code
  gem 'brakeman'
  gem 'code_metrics'
  gem 'debride'
  gem 'rack-mini-profiler'
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'traceroute'
  gem 'unused'
end

group :production do
  gem 'pg'  # PostgreSQL est requis pour Heroku
end
