Rails.application.routes.draw do
  resources :proposals
  resources :faculties
  resources :students
  resources :announcements
  resources :data_points do
    get :forecast, on: :member
  end

  resources :imports do
    member do
      get :confirm
      post ':confirm', action: 'do_confirm'
    end
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

  namespace :main do
    get 'login'
    post 'login', action: 'do_login'
    get 'logout'

    #home
    get 'home'
    get 'student'
    get 'admin'
    get 'lecturer'
  end

  root 'main#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
