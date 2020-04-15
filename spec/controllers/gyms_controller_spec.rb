require 'rails_helper'

describe GymsController,type: :controller do

let(:user) { create(:user) }

  #before do
    #@gyms = create(:gym)
  #end

  describe '#ログイン後' do

    it 'renders the :index template' do

      get :index
      expect(response).to be_success
    end
  end

end
