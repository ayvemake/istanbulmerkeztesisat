# syntax=docker/dockerfile:1
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t service_web .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name service_web service_web

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Optimisation de l'image
FROM ruby:3.2.2-slim as builder

# Installation minimale des dépendances
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    git \
    && rm -rf /var/lib/apt/lists/*

# Installation de Yarn
RUN npm install -g yarn

WORKDIR /app

# Installation des gems avec --without development test
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' && \
    bundle install --jobs 4 --retry 3

# Installation des packages npm en mode production
COPY package.json yarn.lock ./
RUN yarn install --production --frozen-lockfile

# Copie et précompilation des assets
COPY . .
RUN bundle exec rails assets:precompile

# Image finale optimisée
FROM ruby:3.2.2-slim

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    libpq-dev \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copie uniquement les fichiers nécessaires
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
