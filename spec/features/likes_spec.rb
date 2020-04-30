require 'rails_helper'
#require File.expand_path('../config/environment', __dir__)
RSpec.feature "Likes", type: :feature do

  describe "Likes" do

    it "ログインしたユーザーが他人のgymにいいねをする" do

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
      @gym = create(:gym)
      expect {
        click_link "口コミ"
        click_on @gym.name
        click_button 'いいね'
      }.to change(@gym.likes, :count).by(1)

    end
  end
end
