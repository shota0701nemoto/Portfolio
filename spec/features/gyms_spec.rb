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
  end

  it"other_userがuserのgymを削除できない"do
  end
  end
