require 'rails_helper'

RSpec.feature "Gyms", type: :feature do

 #let!(:gym) {create(:gym, name: "goldgym", content: "good" ,picture: "picture" )}

  before do
    visit '/gyms'
  end

  it "商品名、値段が表示される" do
    expect(page).to have_content gym.name
    expect(page).to have_content gym.picture
  end





end
