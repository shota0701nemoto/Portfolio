require 'rails_helper'

RSpec.feature "Blogs", type: :feature do

  it "userがblogを投稿する" do
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
    click_link "コラム"
    click_link "投稿する"
 # 名前、口コミ、写真を投稿する
    fill_in 'blog[title]', with: "Test Task"
    fill_in 'blog[body]', with: "This is Test"
    click_button '投稿する'
 # 作成成功のメッセージが表示されること
    expect(page).to have_content '投稿しました'
  end
end
