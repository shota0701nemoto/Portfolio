require 'rails_helper'

RSpec.feature "Sessions", type: :feature do


  before do
    visit login_path
  end

  it 'ログイン画面が表示される' do
    expect(page).to have_http_status(200)
  end

  it 'ログインする' do
    fill_in 'session[email]', with: 'abcde@example.com'
    fill_in 'session[password]', with: '123456'
    click_on 'ログインボタン'
    expect(page).to have_content 'ログアウト'
  end




end
