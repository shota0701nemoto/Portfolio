#require File.expand_path('../config/environment', __dir__)
require 'rails_helper'

RSpec.describe Blog, type: :model do

  it "タイトル、本文がある場合有効である" do
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
      )
    blog = Blog.new(
      user:@user,
      title: "Title",
      body: "本文",
      id:1,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    )
    expect(blog).to be_valid

  end

  it "タイトルの文字数が28文字を超えていた場合無効である" do
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
      )
    blog = Blog.new(
      title: "TitleTitleTitleTitleTitleTitleTitleTitle",
      body: "本文"
    )
    expect(blog).to be_invalid

  end

  it "本文の文字数が30000文字を超えていた場合無効である" do
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
      )
    blog = Blog.new(
      title: "Title",
      body: "aa" * 400000
    )
    expect(blog).to be_invalid

  end

  it "タイトルの値が空な場合無効である" do
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
      )
    blog = Blog.new(
      title:"",
      body: "testaaaaaa@example.com"
    )
    expect(blog).to be_invalid

  end

  it "本文の値が空な場合無効である" do
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
      )
    blog = Blog.new(
      title: "Title",
      body:""
    )
    expect(blog).to be_invalid

  end
end
