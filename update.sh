#!/bin/bash

# Arrêter en cas d'erreur
set -e

echo "🔄 Mise à jour de l'application..."

# Pull des derniers changements
git pull

# Rebuild et redémarrage des conteneurs
docker-compose -f docker-compose.production.yml build
docker-compose -f docker-compose.production.yml up -d

echo "✅ Mise à jour terminée!" 