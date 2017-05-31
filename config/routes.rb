Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :products do
    resources :comments
  end

  get 'static_pages/imprint' => 'static_pages#imprint' 

  get 'static_pages/about' => 'static_pages#about' 

  get 'static_pages/contact' => 'static_pages#contact'

  get 'static_pages/index' => 'static_pages#index'

  get 'static_pages/landing_page' => 'static_pages#landing_page'

  get 'static_pages/thank_you' => 'static_pages#thank_you'

  post 'static_pages/thank_you' => 'static_pages#thank_you'

  #get 'static_pages/admin' => 'static_pages#admin' 

  root 'static_pages#landing_page' 

  


  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
