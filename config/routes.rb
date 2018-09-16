Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :schools, only: [:index, :show]
    end
  end

  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions' }
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }

  authenticated :admin do
    namespace :admins do
      root 'dashboard#index'
      resources :schools
    end
  end

  authenticated :user do
    root 'dashboard#index'
  end

  resources :user_connectors, only: [:new, :create]
  resources :schools, only: [:index, :show]

  resources :schools do
    resources :messages, only: [:show]
  end

  root 'dashboard#index'
end
