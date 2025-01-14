class PagesController < ApplicationController
  def home
    @services = Service.featured
    @testimonials = Testimonial.latest(3)
    @customer_inquiry = CustomerInquiry.new
  end

  def about
    @team_members = TeamMember.all
  end

  def zones
    @service_areas = ServiceArea.all
  end
end
