Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]
  devise_for :users
  resources :courses do
    resources :lessons
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :admin_user do
    root to: 'admin#index', as: :admin_root
  end

  get 'admin' => 'admin#index'

  #Path for checkouts stripe method
  resources :checkouts, only: [:create]

  #Path for checkouts paydunya method
  # post 'checkouts/create', to: 'checkouts#create', as: :checkouts_create
  # get 'checkouts/callback', to: 'checkouts#callback', as: :checkouts_callback

  post "/webhook" => "webhooks#stripe"

  namespace :admin do
    resources :courses do
      resources :lessons do
        patch 'move', on: :member
      end
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "courses#index"
end
