Rails.application.routes.draw do
  resources :jobs do
    resources :applications, only: ["new", "create"]
  end

  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
