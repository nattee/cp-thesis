Rails.application.routes.draw do
  resources :announcements
  resources :data_points do
    get :forecast, on: :member

  end

  resources :coefficients
  resources :equations

  resources :imports do
    member do
      get :confirm
      post ':confirm', action: 'do_confirm'
    end
  end

  resources :variables do
    get :values, on: :member
    get :add_value, on: :member
  end

  resources :users

  resource :report, only: [] do
    collection do
      get :main
      get :capital_income
      get :pop_car
      get :price_level
    end
  end

  get 'main/login'
  post 'main/login', to: 'main#do_login'
  get 'main/logout'
  get 'main/home'
  get 'main/grad_1'
  get 'main/grad_2'
  root 'main#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
