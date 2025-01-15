source "https://rubygems.org"

# Spécifiez explicitement la version de Ruby
ruby '3.2.2'

# Rails et dépendances de base
gem "rails", "~> 7.1.0"  # Version spécifique
gem "puma", ">= 5.0"

group :development, :test do
  gem "sqlite3"
end

group :production do
  gem "pg"
end

# Gems essentiels
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# Frontend
gem 'tailwindcss-rails'
gem 'hotwire-rails'

# Authentification et Autorisation
gem 'devise'
gem 'pundit'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'rubocop'
  gem 'brakeman'
end

gem 'redis'
gem 'hiredis'

gem 'sitemap_generator'