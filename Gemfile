# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.6.3'

gem 'bcrypt', '3.1.13'
gem 'bootsnap', '1.4.4', require: false
gem 'bootstrap-sass', '3.4.1'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'faker', '2.1.2'
gem 'jbuilder', '2.9.1'
gem 'jquery-rails'
gem 'puma', '3.12.1'
gem 'rails', '6.0.0'
gem 'sass-rails', '5.1.0'
gem 'webpacker', '4.0.7'
gem 'will_paginate', '3.1.8'

gem 'bootstrap'
gem 'cancancan'
gem 'capistrano-yarn'
gem 'carrierwave', '1.2.2'
gem 'ckeditor'
gem 'devise'
gem 'dotenv-rails'
gem 'gretel'
gem 'meta-tags'
gem 'mini_magick', '4.7.0'
gem 'paperclip'
gem 'pg'
gem 'rack-attack'
gem 'rails-i18n', '~> 6.0.0'
gem 'rails_admin', '~> 2.0'
gem 'redcarpet'
gem 'sitemap_generator'
gem 'sprockets-es6'
gem 'summernote-rails'
# gem 'parser'

group :development, :test do
  gem 'byebug', '11.0.1', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-postgresql', '~> 6.2'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
end

group :production, :staging do
  gem 'unicorn'
end

group :development do
  gem 'listen', '3.1.5'
  gem 'rails-erd'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console',           '4.0.1'
end

group :test do
  gem 'capybara',                 '3.28.0'
  gem 'guard',                    '2.15.0'
  gem 'guard-minitest',           '2.4.6'
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.3.8'
  gem 'rails-controller-testing', '1.0.4'
  gem 'selenium-webdriver', '3.142.4'
  gem 'webdrivers', '4.1.2'
end

group :production, :staging do
end

group :production do
  gem 'fog', '1.42'
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
