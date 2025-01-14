class PagesController < ApplicationController
  def home
    @featured_services = Service.featured
    @services = Service.active.limit(6)
    @testimonials = Testimonial.recent if Testimonial.table_exists?
  end

  def about
  end

  def zones
    @service_areas = ServiceArea.all
  end

  def technical_info
    @page_title = "Teknik Bilgiler"
  end
end
