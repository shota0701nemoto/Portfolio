require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  it "userがgymにcommentする" do
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
    )
    visit root_path
    click_link "ログイン"
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button "ログインボタン"

    @gym = create(:gym)

    expect {
      click_link "口コミ"
      click_on @gym.name
      fill_in 'comment[content]', with: "Test Task"
      click_button 'コメントする'
      expect(page).to have_content 'コメントが投稿されました'
    }.to change(@gym.comments, :count).by(1)
  end

  it" コメントを削除する "do
    @user = create(:user,email: "test1@example.com",)
    visit root_path
    click_link "ログイン"
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button "ログインボタン"

    expect {
      click_link "口コミ"
      @gym = create(:gym)
      visit gyms_path(@gym)
      @comment = create(:comment)
      click_on "削除"
      expect(page).to have_content "コメントを削除しました"
    }.to change(Comment, :count).by(0)
  end



  end
