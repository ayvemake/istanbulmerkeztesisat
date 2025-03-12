#!/bin/bash
set -e

echo "🚀 Déploiement vers Hetzner..."

# Variables
HETZNER_IP="65.109.226.75"  # Remplacez par votre IP Hetzner
HETZNER_USER="root"
PROJECT_NAME="istanbulmerkeztesisat"

# Copier le fichier .env
echo "📂 Copie du fichier .env..."
scp .env $HETZNER_USER@$HETZNER_IP:/root/$PROJECT_NAME/

# Copier les fichiers nécessaires
echo "📂 Copie des fichiers vers le serveur..."
rsync -avz --exclude 'node_modules' \
           --exclude '.git' \
           --exclude 'tmp' \
           --exclude 'log' \
           --exclude '.env' \
           ./ $HETZNER_USER@$HETZNER_IP:/root/$PROJECT_NAME/

# Exécuter le déploiement sur le serveur
echo "🔄 Exécution du déploiement..."
ssh $HETZNER_USER@$HETZNER_IP "cd /root/$PROJECT_NAME && ./deploy.sh"

echo "✅ Déploiement terminé !" 