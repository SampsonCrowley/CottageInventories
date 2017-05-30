Rails.application.routes.draw do
  get 'sales/index'

  get 'sales/show'

  get 'sales/new'

  get 'sales/create'

  root to: 'receipts#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
    get :logout, to: 'users/sessions#destroy'
    get :add_user, to: 'users/registrations#new'
  end

  resources :receipts do
    get :add_item
  end

  resources :sales

  resource :inventory, controller: :inventory
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
