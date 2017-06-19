require 'rails_helper'

describe OrdersController, type: :controller do
  context 'GET #index' do

    before do  
     # @order = FactoryGirl.build(:order)
      @user = FactoryGirl.create(:admin)
      sign_in @user
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

   
  end

  context 'GET #show' do
    before do
      @user = FactoryGirl.create( :user)
      sign_in @user
      @product = FactoryGirl.create(:product)
      @order = FactoryGirl.create(:order, product_id: @product.id, user_id: @user.id)
      get :show, params: {id: @order.id}
    end
    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

  end

end