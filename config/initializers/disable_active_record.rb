Rails.application.config.middleware.delete(ActiveRecord::Migration::CheckPending) if defined?(ActiveRecord)

# Désactiver les fonctionnalités liées à ActiveRecord
Rails.application.config.app_middleware.delete(ActiveRecord::QueryCache) if defined?(ActiveRecord)
Rails.application.config.app_middleware.delete(ActiveRecord::ConnectionAdapters::ConnectionManagement) if defined?(ActiveRecord) 