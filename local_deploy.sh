#!/bin/bash
set -e

echo "🚀 Simulation du déploiement en local..."

# Générer une clé secrète pour le test
export SECRET_KEY_BASE=$(openssl rand -hex 64)

# Utiliser la clé maître existante ou en générer une nouvelle
if [ -f config/master.key ]; then
  export RAILS_MASTER_KEY=$(cat config/master.key)
else
  export RAILS_MASTER_KEY=$(openssl rand -hex 32)
  echo $RAILS_MASTER_KEY > config/master.key
fi

# Nettoyer l'environnement Docker local
echo "🧹 Nettoyage de l'environnement Docker..."
docker-compose -f docker-compose.production.yml down -v
docker system prune -f

# Simuler l'obtention du certificat SSL
echo "🔒 Simulation du certificat SSL..."
mkdir -p .ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout .ssl/privkey.pem \
  -out .ssl/fullchain.pem \
  -subj "/CN=localhost"

# Créer une version locale de nginx.conf
echo "📝 Création de la configuration Nginx locale..."
cat > nginx.local.conf << 'EOL'
server {
    listen 80;
    listen 443 ssl;
    server_name localhost;

    ssl_certificate /etc/nginx/ssl/fullchain.pem;
    ssl_certificate_key /etc/nginx/ssl/privkey.pem;
    
    # Le reste de la configuration est identique à nginx.conf
    location / {
        proxy_pass http://web:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /assets {
        expires max;
        add_header Cache-Control public;
        root /app/public;
    }
}
EOL

# Créer docker-compose.local.yml
echo "📦 Création de la configuration Docker Compose locale..."
cat > docker-compose.local.yml << 'EOL'
version: '3.8'

services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      RAILS_ENV: production
      RAILS_SERVE_STATIC_FILES: "true"
      RAILS_LOG_TO_STDOUT: "true"
      SECRET_KEY_BASE: ${SECRET_KEY_BASE}
      RAILS_MASTER_KEY: ${RAILS_MASTER_KEY}
      ASSET_HOST: "http://localhost"
      NODE_ENV: "production"
    volumes:
      - ./.yarnrc:/app/.yarnrc
      - rails_public:/app/public
    networks:
      - web

  nginx:
    image: nginx:alpine
    volumes:
      - ./nginx.local.conf:/etc/nginx/conf.d/default.conf:ro
      - ./.ssl:/etc/nginx/ssl:ro
      - rails_public:/app/public:ro
    ports:
      - "80:80"
      - "443:443"
    depends_on:
      - web
    networks:
      - web

networks:
  web:
    driver: bridge

volumes:
  rails_public:
EOL

# Construction et démarrage
echo "🏗️ Construction des conteneurs..."

# S'assurer que la variable est disponible
export RAILS_MASTER_KEY=$(cat config/master.key)

# Construction avec BuildKit
docker-compose -f docker-compose.local.yml build --no-cache

echo "🚀 Démarrage des conteneurs..."
docker-compose -f docker-compose.local.yml up -d

# Attendre que les conteneurs soient prêts
echo "⏳ Attente du démarrage des services..."
sleep 10

# Vérifier les logs pour les erreurs
echo "📋 Vérification des logs..."
docker-compose -f docker-compose.local.yml logs

echo "✅ Simulation terminée ! L'application devrait être accessible sur:"
echo "   http://localhost"
echo "   https://localhost (auto-signé)"
echo ""
echo "Pour voir les logs en temps réel:"
echo "   docker-compose -f docker-compose.local.yml logs -f"
echo ""
echo "Pour arrêter la simulation:"
echo "   docker-compose -f docker-compose.local.yml down" 