# frozen_string_literal: true

Devise.setup do |config|
  # Utilisation des credentials pour la clé secrète
  config.secret_key = ENV['DEVISE_SECRET_KEY'] || Rails.application.credentials.secret_key_base

  # ... reste de la configuration Devise ...
end 