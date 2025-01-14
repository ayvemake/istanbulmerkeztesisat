class ServicesController < ApplicationController
  def index
    @services = Service.active
    @categories = Service.categories.keys
  end

  def show
    @service = Service.find(params[:id])
  end
end 