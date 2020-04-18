FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn chromium-driver # yarnとchromium-driverを追記
RUN mkdir /portfolio
WORKDIR /portfolio
COPY Gemfile /portfolio/Gemfile
COPY Gemfile.lock /portfolio/Gemfile.lock
RUN gem install bundler # 追記
RUN bundle install
COPY . /portfolio
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]