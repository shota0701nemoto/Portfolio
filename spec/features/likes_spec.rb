require 'rails_helper'
#require File.expand_path('../config/environment', __dir__)
RSpec.feature "Likes", type: :feature do

  describe "Likes" do

    it "ログインしたユーザーが他人のgymにいいねをする" do
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
          click_button 'いいね'
        }.to change(@gym.likes, :count).by(1)
    end

    it "ログインしたユーザーが自身の投稿にいいねをする" do
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
      @gym = create(:gym,user:@user)
      expect {
      click_link "口コミ"
      click_on @gym.name
      click_button 'いいね'
      }.to change(@gym.likes, :count).by(1)
    end

    it "ログインしたユーザーが自身の投稿にいいねをした後、取り消す" do
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
      @gym = create(:gym,user:@user)
      click_link "口コミ"
      click_on @gym.name
      click_button 'いいね'
      expect(page).to have_content "取り消す"
      click_button "取り消す"
      expect(page).to change(@gym.likes, :count).by(0)
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
