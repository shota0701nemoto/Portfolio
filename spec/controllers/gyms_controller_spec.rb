require 'rails_helper'

RSpec.describe GymsController,type: :controller do

  describe '#index' do

    before do
      @user = create(:user)
    end

    it 'renders the :index template' do
      sign_in @user
      get :index
      expect(response).to be_success
    end
  end
  
end
