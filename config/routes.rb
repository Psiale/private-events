Rails.application.routes.draw do
  root 'events#new'
  resources :events, only: [:index, :show, :new, :create]
  resources :users, only: [:index, :show, :new, :create, :update]
  resources :event_attendances, only: [:index, :new, :create, :update]
  get 'sessions/new'
  get 'sessions/welcome'
  post 'sessions/create'
  get 'sessions/destroy'
end
