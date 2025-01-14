Rails.application.routes.draw do
  root 'pages#home'

  # Pages statiques
  get '/about', to: 'pages#about'
  get '/zones-intervention', to: 'pages#zones'

  # Ressources RESTful
  resources :services, only: [:index, :show]
  resources :customer_inquiries, only: [:new, :create], path: 'contact'
end
