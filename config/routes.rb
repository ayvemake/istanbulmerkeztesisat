Rails.application.routes.draw do
  root 'pages#home'

  # Pages statiques
  get '/about', to: 'pages#about'
  get '/zones-intervention', to: 'pages#zones'
  get '/teknik-bilgiler', to: 'pages#technical_info', as: :technical_info

  # Ressources RESTful
  resources :services, only: [:index, :show]
  resources :customer_inquiries, only: [:new, :create], path: 'contact'
  resources :service_areas, only: [:index, :show]
  resources :contacts, only: [:new, :create]
end
