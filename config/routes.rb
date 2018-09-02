Rails.application.routes.draw do
  devise_for :users

  root to: 'channels#index'

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :channels, only: [:index, :update, :new, :create, :destroy]
  resources :memberships, only: [:update, :destroy]

  post '/messages/:id' => 'messages#create', as: 'messages'

  get '/chat/:id' => 'channels#chat', as: 'chat'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
