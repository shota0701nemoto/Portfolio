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
    click_button '登録する'
 # 作成成功のメッセージが表示されること
    expect(page).to have_content '投稿しました'
  end

  it "投稿詳細ページからジム詳細ページに飛ぶことができる" do
    @blog = create(:blog)
    @user = create(:user,email: "test2@example.com",)
    visit root_path
    click_link "ログイン"
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button "ログインボタン"
    click_link "口コミ"
    click_link "投稿する"
    fill_in 'gym[name]', with: "テスト"
    fill_in 'gym[content]', with: "This is Test"
    attach_file "gym_picture", "app/assets/images/test.png"
    click_button '登録する'
    click_link "コラム"
    click_on @blog.title
    expect(page).to have_content @blog.title
    expect(page).to have_content "テスト"
    click_link "Test Task"
    expect(page).to have_content "This is Test"
  end

  it "投稿詳細ページから他の投稿詳細ページには飛ばない" do
    @blog = create(:blog)
    @user = create(:user,email: "test2@example.com",)
    visit root_path
    click_link "ログイン"
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button "ログインボタン"
    click_link "コラム"
    click_button "投稿する"
    fill_in 'blog[title]', with: "Test Task"
    fill_in 'blog[body]', with: "This is Test"
    click_button '登録する'
    click_link "コラム"
    click_link "Test Task"
    expect(page).not_to have_content @blog.title
  end
end
