#!/bin/bash
set -e

# Variables
DOMAIN="www.istanbulmerkeztesisat.com"
EMAIL="anilcan.kahraman@gmail.com"  # Remplacez par votre email

# Charger les variables d'environnement
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

# Installation des dépendances
echo "📦 Installation des dépendances..."
sudo apt-get update
sudo apt-get install -y curl git build-essential certbot python3-certbot-nginx

# Obtention du certificat SSL
echo "🔒 Obtention du certificat SSL..."
certbot certonly --standalone -d $DOMAIN --email $EMAIL --agree-tos --non-interactive

# Construction et démarrage des conteneurs
echo "🚀 Déploiement des conteneurs..."
docker-compose -f docker-compose.production.yml build
docker-compose -f docker-compose.production.yml up -d

# Nettoyage
echo "🧹 Nettoyage..."
docker system prune -f

echo "✅ Déploiement terminé!" 