# syntax=docker/dockerfile:1
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t service_web .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name service_web service_web

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.3.4
FROM ruby:3.2.2-slim

# Installation des dépendances système
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs npm git

# Installation de Yarn
RUN npm install -g yarn

# Création du répertoire de l'application
WORKDIR /app

# Copie des fichiers de dépendances
COPY Gemfile Gemfile.lock ./

# Installation des gems
RUN bundle install

# Copie du reste de l'application
COPY . .

# Précompilation des assets
RUN SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

# Configuration du port
EXPOSE 3000

# Commande de démarrage
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
