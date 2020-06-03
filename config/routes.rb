Rails.application.routes.draw do

  get 'contacts/new'
  get 'contacts/create'
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'static_pages#home'
  #get  '/help',    to: 'static_pages#help'
  #get  '/about',   to: 'static_pages#about'
  #get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :users

  resources :account_activations, only: [:edit]

  resources :posts,         only:  [:new, :show, :create, :destroy]

  resources :comments,               only: [:create, :destroy]

  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :gyms do
    resources :likes, only: [:create, :destroy]
  end

  resources :blogs
  
  resources :relationships, only: [:create, :destroy]
  
  resources :contacts, only: %i(new create) do
      collection do
        post :new, path: :new, as: :new, action: :back
        post :confirm
      end
  end
end
