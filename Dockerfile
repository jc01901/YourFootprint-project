FROM ruby:2.7.2

RUN apt-get update
RUN apt-get install -y nodejs
RUN gem install bundler -v 2.1.4
RUN apt-get install -y default-mysql-client

RUN echo "export PATH=\"$PATH:/usr/local/bundle/bin\"" >> ~/.bashrc

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 3000
# WORKDIR /app/app
CMD ["rails", "server", "-b", "0.0.0.0"]