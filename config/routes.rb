Rails.application.routes.draw do
  resources :users do
    resources :messages, only: [:index, :create, :show]
  end
  resources :channels do
    resources :messages, only: [:index]
    resources :users, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
