Rails.application.routes.draw do
  devise_for :users

  root to: 'channels#index'

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :channels, only: [:index, :new, :create, :destroy]

  post '/messages/:id' => 'messages#create', as: 'messages'

  get '/chat/:id' => 'channels#chat', as: 'chat'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  get '*path' => 'channels#index'
  post '*path' => 'channels#index'
  # TODO: channel subscriptions
  # resources :memberships, only: [:update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
