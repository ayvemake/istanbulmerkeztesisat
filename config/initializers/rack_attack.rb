class Rack::Attack
  ### Configuration ###
  
  # Utiliser Redis si disponible, sinon utiliser Memory Store
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  ### Throttling ###

  # Bloquer les IPs qui font trop de requêtes
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip unless req.path.start_with?('/assets/')
  end

  # Limiter les tentatives de connexion
  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.ip
    end
  end

  ### Custom Response ###
  
  self.throttled_response = lambda do |env|
    [ 429, # status
      {'Content-Type' => 'text/html'},
      ["<html><body><h1>Trop de requêtes. Veuillez réessayer plus tard.</h1></body></html>"]
    ]
  end
end 