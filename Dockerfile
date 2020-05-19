FROM ruby:2.6.6-alpine AS development

LABEL maintainer="Mike Rogers <me@mikerogers.io>"

# Install the Essentials
ENV BUILD_DEPS="curl tar wget linux-headers bash" \
    DEV_DEPS="ruby-dev build-base postgresql-dev zlib-dev libxml2-dev libxslt-dev readline-dev tzdata git nodejs vim"

RUN apk add --update --upgrade $BUILD_DEPS $DEV_DEPS

# Install Yarn
RUN apk add --update yarn

# Add the current apps files into docker image
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Set up environment
ENV PATH /usr/src/app/bin:$PATH

# Add some helpers to reduce typing when inside the containers
RUN echo 'alias bx="bundle exec"' >> ~/.bashrc

# Set ruby version
COPY .ruby-version /usr/src/app

# Install latest bundler
RUN gem update --system && gem install bundler:2.1.4
RUN bundle config --global silence_root_warning 1 && echo -e 'gem: --no-document' >> /etc/gemrc

RUN mkdir -p /usr/src/bundler
RUN bundle config path /usr/src/bundler

EXPOSE 3001
CMD ["bundle", "exec", "middleman", "server", "-p", "3001"]

FROM development AS production

# Install Ruby Gems
COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app
RUN bundle check || bundle install --jobs=$(nproc)

# Install Yarn Libraries
COPY package.json /user/src/app
COPY yarn.lock /user/src/app
RUN yarn install --check-files

# Copy the rest of the app
COPY . /usr/src/app

# Compile the assets
RUN RAILS_ENV=production RACK_ENV=production NODE_ENV=production bundle exec middleman build