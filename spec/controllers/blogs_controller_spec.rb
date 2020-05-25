require 'rails_helper'


RSpec.describe BlogsController, type: :controller do
  describe "#index" do
    before do
      @blog = create(:blog)
      get :index
    end

    it "indexテンプレートが表示される" do
      expect(response).to render_template :index
    end

    it "リクエストが200を返す" do
      expect(response).to have_http_status "200"
    end

    it "@blogsに@blogが含まれている" do
      expect(assigns(:blogs)).to match_array([@blog])
    end
  end

  describe "#show" do
    before do
      @blog = create(:blog)
      @user = create(:user, email:"asddfg@example.com" )
      get :show, params: { id: @blog.id }
    end

    it 'ログインしていない場合でも成功する' do
      expect(response).to have_http_status "200"
    end
  end

  describe "#create" do
    before do
      it 'ログインしていない場合は失敗する' do
        blog_params = attributes_for(:blog)
        post :create, params: {blog: blog_params }
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "#destroy" do
    before do
      it '削除に成功する' do
        blog_params = attributes_for(:blog)
        post :destroy, params: {blog: blog_params }
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#destroy" do
    before do
      it '編集に成功する' do
        blog_params = attributes_for(:blog)
        post :edit, params: {blog: blog_params }
        expect(response).to have_http_status "200"
      end
    end
  end

end
