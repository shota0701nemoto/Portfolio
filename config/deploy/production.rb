# frozen_string_literal: true

# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '13.115.179.212', user: 'shogo', roles: %w[app db web]

# デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/Portfolio_aws_rsa'
