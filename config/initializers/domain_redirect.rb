Rails.application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
  # Redirection de non-www vers www
  r301 %r{.*}, 'https://www.istanbulmerkeztesisat.com$&', if: proc { |rack_env|
    rack_env['SERVER_NAME'] == 'istanbulmerkeztesisat.com'
  }
end 