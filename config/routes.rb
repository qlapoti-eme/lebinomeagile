Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboards", to: "dashboards#index"
  resources :proposals do
    resources :bookings, only: [:index, :new, :create]
  end
end
