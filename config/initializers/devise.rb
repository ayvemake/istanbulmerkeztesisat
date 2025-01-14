# frozen_string_literal: true

Devise.setup do |config|
  # La clé secrète utilisée par Devise et Warden pour générer des signatures aléatoires.
  # config.secret_key = 'copiez_ici_la_clé_générée_par_rails_secret'
  config.secret_key = Rails.application.credentials.secret_key_base || ENV['SECRET_KEY_BASE']

  # ... reste de la configuration Devise ...
end 