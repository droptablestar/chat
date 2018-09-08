FROM starefossen/ruby-node:2-8-stretch
RUN apt-get update -qq && \
    apt-get install -y nano build-essential libpq-dev emacs && \
    gem install bundler
RUN mkdir /chat
COPY Gemfile Gemfile.lock /chat/
WORKDIR /chat
RUN bundle install
COPY . /chat
