require 'rails_helper'

RSpec.describe Like, type: :model do

  it"user、gymが紐づいている場合有効である"do
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
  like = Like.new(
    user:@user,
    gym:@gym,
  )
  expect(like).to be_valid
  end

  it"userが紐づいていない場合無効である"do
  @gym = Gym.create(
    name:"Test",
    content:"TestContent",
    picture:[ Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'app/assets/images/test.png') ]
  )

  like = Like.new(
    gym:@gym
  )
  expect(like).to be_invalid

  end

  it"gymが紐づいていない場合無効である"do
  @user = User.create(
    name: "PortfolioTaro",
    email: "test@example.com",
    password: "test"
  )

  like = Like.new(
   user:@user
  )
  expect(like).to be_invalid

  end
end
