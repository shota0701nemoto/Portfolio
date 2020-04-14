require 'rails_helper'

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
expect {
 # タスク作成ページへ遷移
 click_link "口コミ"
 click_link "投稿する"
 # 名前、口コミ、写真を投稿する
 fill_in 'gym[name]', with: "Test Task"
 fill_in 'gym[content]', with: "This is Test"
 fill_in 'gym[picture][]', with: "picture"
 click_button '登録する'

 # 作成成功のメッセージが表示されること
 expect(page).to have_content '投稿ありがとうございます!'
}.to change(@user.gyms, :count).by(1)
end
end
