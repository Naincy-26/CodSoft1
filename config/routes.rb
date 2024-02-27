Rails.application.routes.draw do
  get 'contact_us/new'
  get 'contact_us/create'
  devise_for :users

  resources :buses do
    get 'index_owner_reservations', on: :member

    resources :reservations, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  get '/buses/search', to: 'buses#index', as: 'search_buses'
  get '/reservations/history', to: 'reservations#history', as: 'reservation_history'

  root "home#index"
  get '/home', to: 'home#index', as: 'home'

  get 'contact_us', to: 'contact_us#new'
  post 'contact_us', to: 'contact_us#create'

  get '/owner/login', to: 'owner_sessions#new', as: :new_owner_session
  post '/owner/login', to: 'owner_sessions#create', as: :create_owner_session
  delete '/owner/logout', to: 'owner_sessions#destroy', as: :destroy_owner_session
end
