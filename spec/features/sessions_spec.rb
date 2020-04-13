require 'rails_helper'

RSpec.feature "Sessions", type: :feature do

  #User.create!(email: 'aaaaasdfg@example.com', password: '123456',name:'あああああ')

  before do
    visit login_path
  end

  it 'ログインする' do
    fill_in 'session[email]', with: 'abcde@example.com'
    fill_in 'session[password]', with: '123456'
    click_on 'ログインボタン'
    expect(page).to have_content 'ログアウト'
  end
  it 'ログインしない' do
    expect(page).to have_link 'アカウントを作成する'
  end



end
