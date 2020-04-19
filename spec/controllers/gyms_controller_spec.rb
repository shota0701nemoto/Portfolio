require 'rails_helper'

RSpec.describe GymsController,type: :controller do

  describe "#index" do
    before do
      @gym = create(:gym)
      get :index
    end

    it "indexテンプレートが表示される" do
      expect(response).to render_template :index
    end

    it "リクエストが200を返す" do
      expect(response).to have_http_status "200"
    end

    it "@gymsに全ての投稿@gymが含まれていること" do
      expect(assigns(:gyms)).to match_array([@gym])
    end
  end

  describe "#show" do
    before do
      @gym = create(:gym)
      @user = create(:user, email:"asddfg@example.com" )
      get :show, params: { id: @gym.id }
    end

    it 'ログインしていない場合はリダイレクトする' do
      expect(response).to redirect_to login_path
    end
  end

  describe "#create" do
    before do
      context "ログインしていない場合" do
        it'302レスポンスを返す' do
          gym_params = attributes_for(:gym)
          post :create, params: {gym: gym_params }
          expect(response).to have_http_status "302"
        end

        it "ログイン画面にリダイレクトする" do
          gym_params = attributes_for(:gym)
          post :create, params: {gym: gym_params }
          expect(response).to redirect_to login_path
        end
      end
    end
  end

  describe "#destroy" do
    before do
      @gym = build(:gym, id:"500")
    end
    context "ログインしている場合" do
      it '302レスポンスを返す' do
        delete :destroy, params: { id: @gym }
        expect(response.status).to eq 302
      end

      it 'gymが削除されること' do
        gym_params = attributes_for(:gym)
        expect do
          delete :destroy, params: {gym: gym_params }
        end .to change(Gym, :count).by(-1)
      end
    end
  end
end
