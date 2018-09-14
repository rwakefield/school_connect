Rails.application.routes.draw do
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

  resources :schools, only: [:index, :show]

  root 'dashboard#index'
end
