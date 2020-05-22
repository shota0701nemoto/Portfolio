#require File.expand_path('../config/environment', __dir__)
require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "コメントがある場合有効である" do
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
    )

    @gym = Gym.create(
      name:"Test",
      content:"TestContent",
      picture:[ Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'app/assets/images/test.png') ]
    )

    comment = Comment.new(
      user:@user,
      gym:@gym,
      content: "good",
    )
    expect(comment).to be_valid
  end

  it "コメントがない場合無効である" do
    @user = User.create(
      name: "PortfolioTaro",
      email: "test@example.com",
      password: "test"
    )

    @gym = Gym.create(
      name:"Test",
      content:"TestContent",
      picture:[ Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'app/assets/images/test.png') ]
    )

    comment = Comment.new(
      user:@user,
      content:"",
    )
    expect(comment).to be_invalid
  end

    it "コメントの文字が200文字を超えたら無効である" do
      @user = User.create(
        name: "PortfolioTaro",
        email: "test@example.com",
        password: "test"
      )

      @gym = Gym.create(
        name:"Test",
        content:"TestContent",
        picture:[ Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'app/assets/images/test.png') ]
      )

      comment = Comment.new(
        user:@user,
        content: "a" * 201
      )
      expect(comment).to be_invalid
    end
  end
