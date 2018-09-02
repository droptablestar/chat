Rails.application.routes.draw do
  devise_for :users

  root to: 'channels#index'

  resources :users
  resources :channels

  get '/chat' => 'channels#chat'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
