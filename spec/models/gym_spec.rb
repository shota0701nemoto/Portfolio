#require File.expand_path('../config/environment', __dir__)
require 'rails_helper'

RSpec.describe Gym, type: :model do

  it "name、content、picture、user_idがある場合有効である" do
    gym = create(:gym)
    expect(gym).to be_valid
  end

  it "nameがない場合、無効である" do
    gym = build(:gym, name: nil)
    gym.valid?
    expect(gym.errors[:name]).to include("を入力してください")
  end

  it "contentがない場合、無効である" do
    gym = build(:gym, content: nil)
    gym.valid?
    expect(gym.errors[:content]).to include("を入力してください")
  end

  it "pictureがない場合、無効である" do
    gym = build(:gym, picture: nil)
    gym.valid?
    expect(gym.errors[:picture]).to include("を入力してください")
  end

  it"user_idがない場合無効である"do
  gym = build(:gym, user_id: nil)
  gym.valid?
  expect(gym.errors[:user_id]).to include("を入力してください")
  end

  it"本文が200文字を超える場合無効である"do
  gym = build(:gym, content: "a" * 201)
  expect(gym).to be_invalid
  end

  it"タイトルが24文字を超える場合無効である"do
  gym = build(:gym, content: "a" * 25)
  expect(gym).to be_invalid
  end

  it""do

  end
end
