Rails.application.routes.draw do
  #devise_for :users
  root to: 'jobs#index'

  resources :jobs, only: ["new", "create", "index", "destroy"] do
    resources :job_applications, only: ["new", "create", "index"]
  end

  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # devise_for :users, path: '', path_names: {
  #   # get '/login' => 'users/sessions#new'
  #   # get '/logout' => 'users/sessions#destroy'
  #   # get '/add' => 'users/registrations#new'
  #
  #   :sign_in => 'login',
  #   :sign_out => 'logout',
  #   :sign_up => 'users/add'
  # }
end
