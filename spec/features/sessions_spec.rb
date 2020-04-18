require 'rails_helper'

RSpec.feature "Sessions", type: :feature do


  before do
    visit login_path
  end

  it 'ログイン画面が表示される' do
    expect(page).to have_http_status(200)
  end

  it 'アカウントを作成する画面が表示される' do
      click_on 'アカウントを作成する'
      expect(page).to have_http_status(200)
  end
  
  it 'アカウントを作成する' do
      click_on 'アカウントを作成する'
      fill_in 'user[name]', with: 'test'
      fill_in 'user[email]', with: 'abcde@example.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'Create my account'
      expect(page).to have_content 'ログアウト'
  end
  
  it 'ログインしてログアウトする' do
       @user = User.create(
        name: "PortfolioTaro",
        email: "test@example.com",
        password: "test"
      )
      fill_in 'session[email]', with: 'test@example.com'
      fill_in 'session[password]', with: 'test'
      click_on 'ログインボタン'
      click_on 'ログアウト'
      expect(page).to have_content 'ジムの口コミ'
  end
  
  it 'ログインする' do
      
      @user = User.create(
       id: "1",
       name: "PortfolioTaro",
       email: "test@example.com",
       password: "test"
      )
    click_on 'ログイン'
    fill_in 'session[email]', with: 'test@example.com'
    fill_in 'session[password]', with: 'test'
    click_on 'ログインボタン'
    expect(page).to have_content 'ログアウト'
  end




end
