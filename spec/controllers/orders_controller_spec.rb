require 'rails_helper'

describe OrdersController, type: :controller do
  context 'GET #index' do

    before do  
     # @order = FactoryGirl.build(:order)
      @user=FactoryGirl.create(:admin)
      sign_in @user
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

   
  end

#  context 'GET #show' do
#    before do
#      @order = FactoryGirl.create(:order)
#      get :show
#   end
#    it 'responds successfully with an HTTP 200 status code' do
#      expect(response).to be_success
#      expect(response).to have_http_status(200)
#    end

#  end

end