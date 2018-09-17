Rails.application.routes.draw do
  devise_for :api_users, path: 'api', controllers: { sessions: 'api_users/sessions', registrations: 'api_users/registrations' }

  namespace :api do
    namespace :v1 do
      resources :schools, only: [:index, :show] do
        resources :messages, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end

  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions' }
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }

  authenticated :admin do
    namespace :admins do
      root 'dashboard#index'
      resources :schools do
        resources :messages, only: [:destroy]
      end
    end
  end

  authenticated :user do
    root 'dashboard#index'
  end

  resources :user_connectors, only: [:new, :create]
  resources :schools, only: [:index, :show] do
    resources :messages, only: [:show]
  end

  root 'dashboard#index'
end
