# syntax=docker/dockerfile:1
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t service_web .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name service_web service_web

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.3.4
FROM ruby:3.2.2

# Installation des dépendances
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN npm install -g yarn

# Configuration du répertoire de travail
WORKDIR /app

# Installation des gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Installation des packages npm
COPY package.json yarn.lock ./
RUN yarn install --ignore-engines

# Copie du code source
COPY . .

# Précompilation des assets
RUN bundle exec rails assets:precompile

# Exposition du port
EXPOSE 3000

# Commande de démarrage
CMD ["rails", "server", "-b", "0.0.0.0"]
