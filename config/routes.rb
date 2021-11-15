Rails.application.routes.draw do
  #devise_for :users
  root to: 'jobs#index'

  resources :jobs, only: ["new", "create", "index", "destroy"] do
    resources :job_applications, only: ["new", "create", "index"]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :api do
    namespace :v1 do
      resources :jobs, only: ["index"]
    end
  end
end
