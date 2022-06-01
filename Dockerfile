FROM elixir:1.12.3

##
# Install system dependencies & tooling
##

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y apt-utils build-essential inotify-tools

ENV DEBIAN_FRONTEND noninteractive

##
# Set development environment
##

ENV MIX_ENV=dev
ENV APP_DIR=/opt/app

WORKDIR ${APP_DIR}

##
# Install app dependencies
##

COPY mix.* ./

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix do deps.get, deps.compile

##
# Main
##

COPY . .
RUN mix compile

