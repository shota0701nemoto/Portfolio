require 'rails_helper'

RSpec.feature "Relationships", type: :feature do

  describe "Relationships" do

  it 'userがother_userをフォローする' do
    # ユーザーを作成
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
    )
    @other_user = create(:user,email: "test1@example.com",)
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
    click_link @gym.name

    click_link "フォロー"

    expect(page).to have_content 'ユーザーをフォローしました'
  end

  it 'userがother_userのフォローを外す' do
    # ユーザーを作成
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
    )
    @other_user = create(:user,email: "test1@example.com",)
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
    click_link @gym.name

    click_link "フォロー"

    expect(page).to have_content 'ユーザーをフォローしました'

    click_link "口コミ"
    click_link @gym.name

    click_link "外す"

    expect(page).to have_content 'ユーザーのフォローを解除しました'
  end
end
