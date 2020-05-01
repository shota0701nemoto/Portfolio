source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.6.3'

gem 'rails', '6.0.0'
gem 'bcrypt',                  '3.1.13'
gem 'faker',                   '2.1.2'
gem 'will_paginate',           '3.1.8'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'
gem 'puma',       '3.12.1'
gem 'sass-rails', '5.1.0'
gem 'webpacker',  '4.0.7'
gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.4', require: false
gem 'jquery-rails'


gem 'carrierwave',             '1.2.2'
gem 'mini_magick',             '4.7.0'
gem 'rails_admin', '~> 2.0'
gem 'cancancan'
gem 'meta-tags'
gem 'redcarpet'
gem 'summernote-rails'
gem 'ckeditor'
gem 'meta-tags'
gem 'sitemap_generator'
gem 'rails-i18n', '~> 6.0.0'
gem 'paperclip'
gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'
gem "gretel"
gem 'devise'
gem 'dotenv-rails'
gem 'pg'
gem 'rack-attack'



group :development, :test do
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem "factory_bot_rails"
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara',                 '3.28.0'
  gem 'selenium-webdriver',       '3.142.4'
  gem 'webdrivers',               '4.1.2'
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.3.8'
  gem 'guard',                    '2.15.0'
  gem 'guard-minitest',           '2.4.6'
  gem 'rspec-rails'


end

group :production, :staging do
  gem 'unicorn'
end

group :production do
  gem 'fog', '1.42'
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
