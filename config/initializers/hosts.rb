# Autoriser les domaines de Railway en production
if Rails.env.production?
  Rails.application.config.hosts << "healthcheck.railway.app"
  Rails.application.config.hosts << /.*\.railway\.app/
end 