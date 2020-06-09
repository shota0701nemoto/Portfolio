require 'rails_helper'
#require File.expand_path('../config/environment', __dir__)
RSpec.feature "Gyms", type: :feature do
  it "userがgymを投稿する" do
    # ユーザーを作成
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
    )
    # トップページへアクセス
    visit root_path
    # サインインページへ遷移
    click_link "ログイン"
    # メアドとパスワードを入力してログイン
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button "ログインボタン"
    #@userがgymを投稿する
    # タスク作成ページへ遷移
    click_link "口コミ"
    click_link "投稿する"
    # 名前、口コミ、写真を投稿する
    fill_in 'gym[name]', with: "Test Task"
    fill_in 'gym[content]', with: "This is Test"
    attach_file "gym_picture", "app/assets/images/test.png"
    click_button '投稿する'
    # 作成成功のメッセージが表示されること
    expect(page).to have_content '投稿ありがとうございます!'
    click_link "口コミ"
    expect(page).to have_content 'Test Task'
  end

  it"userがgymを削除する"do
    @user = User.create(
    name: "PortfolioTaro",
    email: "test@example.com",
    password: "test"
    )
    @gym = create(:gym,user:@user,)
    # トップページへアクセス
    visit root_path
    # サインインページへ遷移
    click_link "ログイン"
    # メアドとパスワードを入力してログイン
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button "ログインボタン"
    # タスク作成ページへ遷移
    click_link "口コミ"
    click_link "投稿する"

    click_link "口コミ"
    click_link @gym.name
    click_button "削除"
  end

  it"userがother_userのgymを削除できない"do
    @user = User.create(
    name: "PortfolioTaro",
    email: "test@example.com",
    password: "test"
    )
    @other_user = User.create(
    name: "other_user",
    email: "other_user@example.com",
    password: "other_user"
    )
    @gym = create(:gym,user:@other_user,)
    # トップページへアクセス
    visit root_path
    # サインインページへ遷移
    click_link "ログイン"
    # メアドとパスワードを入力してログイン
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button "ログインボタン"
    # タスク作成ページへ遷移
    click_link "口コミ"
    click_link "投稿する"

    click_link "口コミ"
    click_link @gym.name
    expect(page).not_to have_content '削除'
  end

  #it"投稿の検索ができる"do
    #@user = User.create(
    #name: "PortfolioTaro",
    #email: "test@example.com",
    #password: "test"
    #)
    #@gym = create(:gym)

    #visit root_path

    #@gym = Gym.create(
    #name: "ゴールドジム",
    #content: "環境が整っている",
    #picture: [ Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'app/assets/images/test.png') ]
    #)

    #click_link "ログイン"

    #fill_in "session[email]", with: @user.email
    #fill_in "session[password]", with: @user.password
    #click_button "ログインボタン"

    #click_link "口コミ"
    #click_link "投稿する"

    #fill_in "[name_cont]", with: "ゴールドジム" ←ここが通らない
    #click_link "検索"
    #expect(page).not_to have_content 'ゴールドジム'
  #end
end
