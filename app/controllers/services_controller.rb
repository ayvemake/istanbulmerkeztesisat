class ServicesController < ApplicationController
  def index
    @all_services = Service.all.order(:name)
    @services = Service.all.order(:service_type)
    @categories = {
      'Tüm Hizmetlerimiz' => @all_services.each_with_object({}) do |service, hash|
        hash[service.name] = service.id
      end
    }
  end

  def show
    @service = Service.find(params[:id])
    @related_services = Service.where(service_type: @service.service_type)
                              .where.not(id: @service.id)
                              .limit(3)
  end
end 