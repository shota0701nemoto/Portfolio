#require File.expand_path('../config/environment', __dir__)
require 'rails_helper'

RSpec.describe Gym, type: :model do

  it "name、content、picture、user_idがある場合有効である" do
    gym = Gym.create(
      name: "ゴールドジム",
      content: "good",
      picture: "test.png",
      user_id: "1"
    )
    expect(gym).to be_valid
  end

  it "nameがない場合、無効である" do
    gym = Gym.new(
      name: nil,
      content: "good",
      picture:"test",
      user_id: "1"
    )
    expect(gym).to be_invalid
  end

  it "contentがない場合、無効である" do
    gym = Gym.new(
      name: "ゴールドジム",
      content: nil,
      picture:"test",
      user_id: "1"
    )
    expect(gym).to be_invalid
  end

  it "pictureがない場合、無効である" do
    gym = Gym.new(
      name: "ゴールドジム",
      content: "good",
      picture: nil,
      user_id: "1"
    )
  expect(gym).to be_invalid
  end
end

