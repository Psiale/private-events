Rails.application.routes.draw do
  resources :events, only: [:index, :show, :new, :create]
  resources :sessions, only: [:new, :welcome, :create, :destroy]
  # get 'sessions/new'
  # get 'sessions/welcome'
  # post 'sessions/create'
  # get 'sessions/destroy'
  resources :users, only: [:index, :show, :new, :create, :update]
  resources :event_attendances, only: [:index, :new, :create, :update]
  root 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
