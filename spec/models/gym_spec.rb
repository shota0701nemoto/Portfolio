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
end
