Rails.application.config.middleware.delete(ActiveRecord::Migration::CheckPending) if defined?(ActiveRecord)

# Désactiver les fonctionnalités liées à ActiveRecord
Rails.application.config.app_middleware.delete(ActiveRecord::QueryCache) if defined?(ActiveRecord)

# Configuration pour ActiveRecord
if defined?(ActiveRecord)
  ActiveSupport.on_load(:active_record) do
    self.verbose_query_logs = Rails.env.development?
    self.database_selector = { delay: 2.seconds }
    self.database_resolver = ActiveRecord::Middleware::DatabaseSelector::Resolver
    self.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session
  end
end 