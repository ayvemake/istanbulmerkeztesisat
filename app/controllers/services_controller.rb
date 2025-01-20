class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :set_category, only: [:index]

  def index
    @services = Service.includes(:advantages, :gallery_images)
    @services = @services.where(category: @category) if @category.present?
    @services = @services.active.order(featured: :desc, created_at: :desc)

    respond_to do |format|
      format.html
      format.turbo_stream if params[:query].present?
    end
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
    @related_services = Service.active
                              .where(category: @service.category)
                              .where.not(id: @service.id)
                              .includes(:advantages)
                              .limit(3)

    # Pour le SEO
    set_meta_tags(
      title: @service.name,
      description: @service.meta_description,
      keywords: @service.meta_keywords
    )
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def set_category
    @category = params[:category]
    redirect_to services_path if @category && !Service::CATEGORIES.include?(@category)
  end

  def service_params
    params.require(:service).permit(
      :name, :description, :category, :featured,
      :urgent, :available_24_7, :warranty,
      :meta_description, :meta_keywords,
      :image, gallery_images: [], 
      advantages_attributes: [:id, :title, :description, :_destroy]
    )
  end
end 