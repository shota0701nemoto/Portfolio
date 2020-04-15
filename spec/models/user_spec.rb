#require File.expand_path('../config/environment', __dir__)
require 'rails_helper'

RSpec.describe User, type: :model do

  it "名前、メール、パスワードがある場合有効である" do
    user = User.new(
      name: "PortfolioTaro",
      email: "testaaaaaa@example.com",
      password:"test"
    )
    expect(user).to be_valid
  end

  it "名前がない場合、無効である" do
    user = User.new(
      name: nil,
      email: "testaaaaaa@example.com",
      password:"test"
    )
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "メールがない場合、無効である" do
    user = User.new(
      name: "PortfolioTaro",
      email:"nil",
      password:"test"
    )
    user.valid?
    expect(user.errors[:email]).to include("は不正な値です")
  end

  it "パスワードがない場合、無効である" do
    user = User.new(
      name: "PortfolioTaro",
      email: "testaaaaaa@example.com",
      password:"nil"
    )
    user.valid?
    expect(user).to be_valid
  end
end
