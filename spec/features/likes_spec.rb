require 'rails_helper'
#require File.expand_path('../config/environment', __dir__)
RSpec.feature "Likes", type: :feature do

  describe "Likes" do
    it "userがgymにいいねをする" do
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
      click_link 'Test Task'
      expect(page).to have_content "This is Test"
      click_link 'いいね'
      expect(page).to have_content "1"
    end

    it "userがgymのいいねを取り消す" do
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
      click_link 'Test Task'
      expect(page).to have_content "This is Test"
      click_link 'いいね'
      expect(page).to have_content "1"
      click_link '取り消す'
      expect(page).not_to have_content "1"
    end
    it"other_userがuserの投稿にいいねする"do
    end
    it"other_userがuserの投稿のいいねを取り消す"do
    end
    it "ログインしたユーザーが他人の投稿にいいねをした後、取り消す" do
      @user = User.create(
        name: "PortfolioTaro",
        email: "test@example.com",
        password: "test"
      )
      @other_user = create(:user,email: "test1@example.com",)
        visit root_path
        click_link "ログイン"
        fill_in "session[email]", with: @user.email
        fill_in "session[password]", with: @user.password
        click_button "ログインボタン"
        @gym = create(:gym,user:@other_user,)
          click_link "口コミ"
          click_on @gym.name
          click_button 'いいね'
          expect(page).to have_content "取り消す"
          click_button "取り消す"
          expect(page).to change(@gym.likes, :count).by(0)
end
        end
  end
