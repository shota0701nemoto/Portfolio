require 'rails_helper'


RSpec.describe SessionsController, type: :controller do
  describe "loginページ" do

     context 'ログインしていない場合'

       it "loginページが表示される" do
        get :new
        expect(response).to be_successful
       end
  end
end
