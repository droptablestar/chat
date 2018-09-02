Rails.application.routes.draw do
  get 'memberships/new'
  get 'memberships/delete'
  devise_for :users

  root to: 'channels#index'

  resources :users, only: [:index, :show, :edit, :update, :delete]
  resources :channels, only: [:index, :show, :edit, :update, :delete, :new]
  resources :memberships, only: [:update, :destroy]

  get '/chat/:id' => 'channels#chat', as: 'chat'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
