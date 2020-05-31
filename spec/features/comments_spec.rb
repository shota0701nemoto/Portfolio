require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  describe "Comments" do
    it "userが自身で作成したgymにコメントをする" do
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
      fill_in 'comment[content]', with: "Test Comment"
      click_button 'コメントする'
      click_button 'コメントを表示'
      expect(page).to have_content 'Test Comment'
    end

    it "userが自身で作成したgymのコメントを消す" do
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
      fill_in 'comment[content]', with: "Test Comment"
      click_button 'コメントする'
      click_button 'コメントを表示'
      expect(page).to have_content 'Test Comment'
      click_link '削除する'
      expect(page).not_to have_content 'Test Comment'
    end

    it"other_userがuserの作成したgymにコメントをする"do
      @user = User.create(
      name: "test",
      email: "test@example.com",
      password: "test"
    )
    @other_user = User.create(
      name: "other_user",
      email: "other_user@example.com",
      password: "other_user"
    )

    # トップページへアクセス
    visit root_path
    # サインインページへ遷移
    click_link "ログイン"
    # メアドとパスワードを入力してログイン
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button "ログインボタン"

    @gym = create(:gym,user:@other_user,)
    # タスク作成ページへ遷移
    click_link "口コミ"
    click_link "test"
    fill_in 'comment[content]', with: "userのコメント"
    click_button "コメントする"
    expect(page).to have_content 'コメントが投稿されました'
    end

    it"other_userがuserの作成したgymにコメントしたのを消す"do
    @user = User.create(
    name: "test",
    email: "test@example.com",
    password: "test"
   )
   @other_user = User.create(
    name: "other_user",
    email: "other_user@example.com",
    password: "other_user"
   )

  # トップページへアクセス
  visit root_path
  # サインインページへ遷移
  click_link "ログイン"
  # メアドとパスワードを入力してログイン
  fill_in "session[email]", with: @user.email
  fill_in "session[password]", with: @user.password
  click_button "ログインボタン"

  @gym = create(:gym,user:@other_user,)
  # タスク作成ページへ遷移
  click_link "口コミ"
  click_link "test"
  fill_in 'comment[content]', with: "userのコメント"
  click_button "コメントする"
  expect(page).to have_content 'コメントが投稿されました'
  click_button "コメントを表示"
  click_button "削除"
  page.driver.browser.switch_to.alert.accept
  expect(page).to have_content 'userのコメント'
    end

    it"other_userがuserのコメントを消せない"do
    end
  end
end
