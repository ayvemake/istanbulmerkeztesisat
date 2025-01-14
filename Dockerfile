# syntax=docker/dockerfile:1
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t service_web .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name service_web service_web

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.3.4
FROM ruby:3.2.2-slim as builder

# Installation des dépendances système
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs npm git

# Installation de Yarn
RUN npm install -g yarn

WORKDIR /rails

# Installation des gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copie de l'application
COPY . .

# Précompilation des assets
RUN SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

# Image finale
FROM ruby:3.2.2-slim

RUN apt-get update -qq && \
    apt-get install -y libpq-dev nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /rails

# Copie depuis l'image builder
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /rails /rails

# Configuration pour la production
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
