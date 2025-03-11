#!/bin/bash
set -e

echo "🧹 Nettoyage des assets..."
bundle exec rake assets:clobber

echo "🔨 Compilation des assets..."
yarn build:css
bundle exec rake assets:precompile RAILS_ENV=production

echo "🚀 Déploiement sur Heroku..."
git add .
git commit -m "Deploy: $(date)" || true
git push heroku main

echo "🔄 Redémarrage de l'application..."
heroku restart

echo "✅ Déploiement terminé avec succès!" 