require 'rails_helper'

RSpec.feature "Comments", type: :feature do


 it "userがgymにcommentする" do
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
 click_on @gym.name
 # 名前、口コミ、写真を投稿する
 fill_in 'comment[content]', with: "Test Task"
 click_button 'コメントする'

 # 作成成功のメッセージが表示されること
 expect(page).to have_content 'コメントが投稿されました'
}.to change(@user.comments, :count).by(1)
end

it"ジム詳細ページから投稿詳細ページに飛ぶことができる "do

end


end
