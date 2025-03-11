require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # En mode développement, le code est rechargé à chaque requête
  config.enable_reloading = true

  # Ne pas charger tout le code au démarrage
  config.eager_load = false

  # Afficher les erreurs complètes
  config.consider_all_requests_local = true

  # Activer le cache si le fichier existe
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
    config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Autoriser tous les hôtes en développement
  config.hosts = nil

  # Configuration des assets
  config.assets.debug = true
  config.assets.compile = true
  config.assets.quiet = true
  
  # Désactiver la vérification de la clé maître en développement
  config.require_master_key = false
  
  # Clé secrète pour le développement
  config.secret_key_base = 'x' * 32
end
