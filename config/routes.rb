Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete 'sessions/log_out', to: 'sessions#logout'
  get 'sessions/logged_in', to: 'sessions#logged_in'
end
