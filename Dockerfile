# syntax=docker/dockerfile:1
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t service_web .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name service_web service_web

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Première étape : Construction
FROM node:18.19.0-slim as node
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production --network-timeout 100000

FROM ruby:3.2.2-slim as builder

# Installation des dépendances système
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copie des fichiers de dépendances
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' && \
    bundle install --jobs 4 --retry 3

# Copie des assets Node.js
COPY --from=node /app/node_modules ./node_modules
COPY . .

# Précompilation des assets
RUN bundle exec rails assets:precompile RAILS_ENV=production

# Image finale
FROM ruby:3.2.2-slim

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copie des fichiers nécessaires
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app/public/assets /app/public/assets
COPY --from=builder /app/public/packs /app/public/packs
COPY . .

# Configuration pour la production
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
