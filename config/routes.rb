Rails.application.routes.draw do
  resources :events
  # resources :sessions
  get 'sessions/new'
  get 'sessions/welcome'
  post 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :event_attendances
  root 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
