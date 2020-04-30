FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn chromium-driver # yarnとchromium-driverを追記
RUN mkdir /Portfolio
# こことdocker-composeのvolumeの右辺を揃える(大文字小文字が違いました。)
WORKDIR /Portfolio
COPY Gemfile /Portfolio/Gemfile
COPY Gemfile.lock /Portfolio/Gemfile.lock
RUN gem install bundler # 追記
RUN bundle install
COPY . /Portfolio
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]