Rails.application.routes.draw do



  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

  resources :account_activations, only: [:edit]

  resources :posts,         only:  [:new, :show, :create, :destroy]

  resources :comments,               only: [:create, :destroy]

  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :gyms

  resources :blogs
end
