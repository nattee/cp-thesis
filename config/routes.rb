Rails.application.routes.draw do
  resources :programs
  resources :exams do
    collection do
      get :committee
    end
    member do
      get :download_exam
      get :download_invitation
      get :approve
      post :approve, action: 'update_approve'
    end
  end
  resources :proposals do
    member do
      get :download
    end
  end
  resources :faculties

  resources :students do
    member do
      get :act_proposal
      get :act_exam
    end
  end
  resources :announcements


  resources :users


  namespace :main do
    get 'login'
    post 'login', action: 'do_login'
    get 'logout'

    #home
    get 'home'
    get 'student'
    get 'staff'
    get 'faculty'
  end

  root 'main#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
