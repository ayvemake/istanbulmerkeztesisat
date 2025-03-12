# Dockerfile for production

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t service_web .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name service_web service_web

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Première étape : Construction Node.js
FROM node:18.19.0-slim AS node
WORKDIR /app

COPY package.json yarn.lock ./
RUN npm config set registry https://registry.npmmirror.com \
    && npm install --production --network-timeout=600000

# Deuxième étape : Construction Ruby
FROM ruby:3.2.2-slim AS builder

# Installation des dépendances système
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    libpq-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/* && \
    npm install -g yarn

WORKDIR /app

# Copie des fichiers de dépendances
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' && \
    bundle install --jobs 4 --retry 3

# Copie des assets Node.js
COPY --from=node /app/node_modules ./node_modules
COPY . .

# Précompilation des assets
ARG RAILS_MASTER_KEY
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}
RUN yarn install && \
    yarn build && \
    yarn build:css && \
    RAILS_ENV=production bundle exec rails assets:precompile && \
    mkdir -p /app/public/assets /app/public/images && \
    cp -r app/assets/builds/* public/assets/ && \
    cp -r app/assets/images/* public/images/ && \
    cp -r app/assets/builds/application.tailwind.css public/assets/ && \
    chmod -R 755 public/assets public/images

# Image finale
FROM ruby:3.2.2-slim AS final

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Créer les dossiers nécessaires avant la copie
RUN mkdir -p /app/public/assets /app/public/images /app/tmp/pids /app/tmp/cache /app/tmp/sockets && \
    chmod -R 777 /app/tmp && \
    chmod -R 755 /app/public

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app/public/assets /app/public/assets/
COPY --from=builder /app/public/images /app/public/images/
COPY . .

# Configuration pour la production
ENV RAILS_ENV=production \
    RAILS_SERVE_STATIC_FILES=true \
    RAILS_LOG_TO_STDOUT=true

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
