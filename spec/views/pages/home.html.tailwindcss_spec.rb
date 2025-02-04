require 'rails_helper'

RSpec.describe 'pages/home', type: :view do
  before do
    assign(:thermal_images, [
             { url: 'thermal/thermal1.webp', title: 'Test Image' }
           ])
    assign(:tesisat_services, [
             ServicePreview.new(
               name: 'Test Service',
               description: 'Test Description',
               category: 'tesisat'
             )
           ])
    assign(:boya_services, [])
    assign(:featured_services, [])
    assign(:testimonials, [])
    assign(:service_galleries, {})
    assign(:unblock_images, [])

    # Stub les méthodes helper
    allow(view).to receive_messages(
      render: nil,
      asset_exists?: true,
      content_for: nil
    )
  end

  include_examples 'a page with layout', {
    template: 'pages/home',
    content: ['Test Image', 'Test Service']
  }
end
