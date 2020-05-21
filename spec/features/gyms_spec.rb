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
  end

  it "他人が投稿したgymを削除できない" do
  @user = create(:user,email: "test1@example.com",)
  visit root_path
  click_link "ログイン"
  fill_in "session[email]", with: @user.email
  fill_in "session[password]", with: @user.password
  click_button "ログインボタン"
  @gym = create(:gym)
  click_link "口コミ"
  click_on @gym.name
  expect{
    expect(page).not_to have_content "削除"
  }.to change(Comment, :count).by(0)
end

it "自分が投稿したgymを削除する" do
@user = create(:user,email: "test1@example.com",)
visit root_path
click_link "ログイン"
fill_in "session[email]", with: @user.email
fill_in "session[password]", with: @user.password
click_button "ログインボタン"
click_link "口コミ"
click_link "投稿する"
fill_in 'gym[name]', with: "Test Task"
fill_in 'gym[content]', with: "This is Test"
attach_file "gym_picture", "app/assets/images/test.png"
click_button '投稿する'
click_on 'ジム一覧'
click_on "Test Task"
expect{
  expect(page).to have_content "削除"
}.to change(Comment, :count).by(0)
end

it "ジム詳細ページから記事詳細ページにとべる"do
@gym = create(:gym)
@user = create(:user,email: "test2@example.com",)
visit root_path
click_link "ログイン"
fill_in "session[email]", with: @user.email
fill_in "session[password]", with: @user.password
click_button "ログインボタン"
click_link "コラム"
click_link "投稿する"
fill_in 'blog[title]', with: "Test Task"
fill_in 'blog[body]', with: "This is Test"
click_button '投稿する'
click_link "口コミ"
click_on @gym.name
expect(page).to have_content "Test Task"
click_link "Test Task"
expect(page).to have_content "Test Task"
end

it "ジム詳細ページから別の関連ジム詳細ページにとべる"do
@gym = create(:gym)
@user = create(:user,email: "test2@example.com",)
visit root_path
click_link "ログイン"
fill_in "session[email]", with: @user.email
fill_in "session[password]", with: @user.password
click_button "ログインボタン"
click_link "口コミ"
click_link "投稿する"
fill_in 'gym[name]', with: "Test Task"
fill_in 'gym[content]', with: "This is Test"
attach_file "gym_picture", "app/assets/images/test.png"
click_button '投稿する'
click_link "ジム一覧"
click_on @gym.name
expect(page).to have_content "Test Task"
click_link "Test Task"
expect(page).to have_content "This is Test"
end
end
