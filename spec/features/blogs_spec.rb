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

  it"userがblogを更新する"do

    @user = User.create(
    name: "PortfolioTaro",
    email: "test@example.com",
    password: "test"
    )
    @blog = create(:blog,user:@user,)

    visit root_path

    click_link "ログイン"

    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button "ログインボタン"

    click_link "コラム"
    click_link @blog.title
    click_link "編集"
    click_button "投稿する"
    expect(page).to have_content '更新しました'
  end

  it"userがblogを削除する"do

  end

  it"userがother_userのblogを削除できない"do
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
  @blog = create(:blog,user:@other_user,)

  visit root_path

  click_link "ログイン"

  fill_in "session[email]", with: @user.email
  fill_in "session[password]", with: @user.password
  click_button "ログインボタン"

  click_link "コラム"
  click_link @blog.title
  expect(page).not_to have_content '削除'
  end
end
