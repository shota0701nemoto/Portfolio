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
 click_button '登録する'

 # 作成成功のメッセージが表示されること
 #expect(page).to have_content '投稿ありがとうございます!'
expect(page).to have_content '投稿ありがとうございます!'
end

it"自ら投稿したgymを削除する"do
  @user = create(:user,email: "test1@example.com",)
  visit root_path
  click_link "ログイン"
  fill_in "session[email]", with: @user.email
  fill_in "session[password]", with: @user.password
  click_button "ログインボタン"
  @gym = create(:gym)
  click_link "口コミ"
  click_on @gym.name
  click_on "削除"
  expect{
    expect(page).to have_content "コメントを削除しました"
  }.to change(Comment, :count).by(0)
end

it"ジム詳細ページから投稿詳細ページに飛ぶことができる "do

end

end
