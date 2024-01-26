Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete 'sessions/log_out', to: 'sessions#logout'
  get 'sessions/logged_in', to: 'sessions#logged_in'
  resources :items, only: [:index, :show, :create, :edit, :update, :destroy]
 
  resources :reservations, only: [:index, :show, :create, :destroy]
  
end
