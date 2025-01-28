Rails.application.routes.draw do
  root 'pages#home'

  # Pages statiques
  get 'about', to: 'pages#about', as: :about
  get 'zones-intervention', to: 'pages#zones', as: :zones
  get 'teknik-bilgiler', to: 'pages#technical_info', as: :technical_info
  get 'teknikler', to: 'pages#teknikler'

  # Routes pour les services
  get 'hizmetler', to: 'services#index', as: :services
  get 'hizmetler/tesisat', to: 'services#index', defaults: { category: 'tesisat' }, as: :tesisat_services
  get 'hizmetler/boya', to: 'services#index', defaults: { category: 'boya' }, as: :boya_services
  
  # Route pour les services individuels
  resources :services, only: [:show]

  # Autres ressources
  resources :customer_inquiries, only: [:new, :create], path: 'contact'
  resources :service_areas, only: [:index, :show]
  resources :contacts, only: [:new, :create]

  get 'services/update_categories', to: 'services#update_categories'

  # Routes PWA
  get '/service-worker.js', to: 'pwa#service_worker'
  get '/manifest.json', to: 'pwa#manifest'
end
