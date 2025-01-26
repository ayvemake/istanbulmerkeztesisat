class ServicesController < ApplicationController
  before_action :set_service, only: [:show]

  def index
    @services = Service.includes(:service_advantages)
    
    # Récupérer la catégorie depuis les paramètres ou les defaults de la route
    @category = params[:category]
    
    # Filtrer les services si une catégorie est spécifiée
    @services = @services.where(category: @category) if @category.present?
    
    # Ordonner les services
    @services = @services.order(featured: :desc, created_at: :desc)

    @tesisat_services = Service.tesisat
    @boya_services = Service.boya
  end

  def tesisat_services
    @services = Service.where(category: 'tesisat')
    @category = 'tesisat'
    render :index
  end

  def boya_services
    @services = Service.where(category: 'boya')
    @category = 'boya'
    render :index
  end

  def update_categories
    # Migration des services existants
    Service.find_by(name: 'İç Cephe Boyama')&.update(category: 'painting')
    Service.find_by(name: 'Dış Cephe Boyama')&.update(category: 'painting')
    Service.find_by(name: 'Dekoratif Boya')&.update(category: 'painting')
    
    Service.find_by(name: 'Su Tesisatı')&.update(category: 'plumbing')
    Service.find_by(name: 'Tıkanıklık Açma')&.update(category: 'plumbing')
    Service.find_by(name: 'Kaçak Tespiti')&.update(category: 'plumbing')
  end

  def show
    @service = Service.includes(:service_advantages).find(params[:id])
    
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          "modal",
          partial: "services/service_details",
          locals: { service: @service }
        )
      end
    end
  end

  private

  def set_service
    @service = Service.includes(:service_advantages).find(params[:id])
  end

  def display_category(category)
    case category
    when 'tesisat'
      'Tesisat Hizmetleri'
    when 'boya'
      'Boya ve Dekorasyon'
    else
      'Tüm Hizmetler'
    end
  end
  helper_method :display_category

  def service_params
    params.require(:service).permit(
      :name, :description, :category, :featured,
      :urgent, :available_24_7, :warranty,
      gallery_images: [], 
      advantages_attributes: [:id, :title, :description, :_destroy]
    )
  end
end 