Rails.application.routes.draw do
  devise_for :users

  root to: 'channels#index'

  resources :users, only: [:index, :show, :edit, :update, :delete]
  resources :channels, only: [:index, :show, :edit, :update, :delete, :new]
  resources :memberships, only: [:update, :destroy]

  post '/messages/:id' => 'messages#create', as: 'messages'

  get '/chat/:id' => 'channels#chat', as: 'chat'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # resources :chatrooms, param: :slug
  # resources :messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
