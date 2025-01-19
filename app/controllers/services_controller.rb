class ServicesController < ApplicationController
  def index
    @category = params[:category]
    @services = if @category.present?
      Service.where(category: @category)
    else
      Service.all
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
    @service = Service.find(params[:id])
    @related_services = Service.where(category: @service.category)
                              .where.not(id: @service.id)
                              .limit(3)
  end

  def service_params
    params.require(:service).permit(:name, :description, :category, :price, :image)
  end
end 