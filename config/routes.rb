Rails.application.routes.draw do
  root 'pages#home'

  # Pages statiques avec les helpers de route nommés
  get 'about', to: 'pages#about', as: :about
  get 'zones-intervention', to: 'pages#zones', as: :zones
  get 'teknik-bilgiler', to: 'pages#technical_info', as: :technical_info

  # Routes pour les services
  get 'hizmetler', to: 'services#index', as: :hizmetler
  resources :services, only: [:index, :show]

  # Autres ressources
  resources :customer_inquiries, only: [:new, :create], path: 'contact'
  resources :service_areas, only: [:index, :show]
  resources :contacts, only: [:new, :create]

  get 'services/update_categories', to: 'services#update_categories'
end
