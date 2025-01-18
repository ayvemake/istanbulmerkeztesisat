# frozen_string_literal: true

Devise.setup do |config|
  # Utilisation des credentials pour la clé secrète
  config.secret_key = Rails.application.credentials.dig(:devise, :secret_key)

  # ... reste de la configuration Devise ...
end 