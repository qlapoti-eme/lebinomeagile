Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :proposals do
    resources :bookings, only: [:index, :new, :create]
  end
end
