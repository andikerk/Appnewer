require 'rails_helper'

describe OrdersController, type: :controller do
  context 'GET #index' do

    before do  
      @user1 = FactoryGirl.create(:admin)
      @user2 = FactoryGirl.create(:user)
      
      
    end

    it 'lets admin access order index page' do
      sign_in @user1
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'redirects user to root' do
      sign_in @user2
      get :index
      expect(response).to redirect_to root_path
      
    end

  end

  context 'GET #show' do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create( :user)
      sign_in @user
     
      @order = FactoryGirl.create(:order, product_id: @product.id, user_id: @user.id)
      get :show, params: {id: @order.id}
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

  end

end