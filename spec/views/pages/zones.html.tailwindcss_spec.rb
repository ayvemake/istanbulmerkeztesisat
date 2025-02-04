require 'rails_helper'

RSpec.describe 'pages/zones', type: :view do
  before do
    assign(:service_areas, [
             TestModels::ServiceArea.new(
               name: 'Test Area',
               districts: ['District 1', 'District 2'],
               description: 'Test area description',
               postal_code: '34000'
             )
           ])

    # Stub le partial de zone
    allow(view).to receive(:render)
      .with(hash_including(partial: 'pages/zone_card'))
      .and_return(<<~HTML)
        <div class="zone-card">
          <h3>Test Area</h3>
          <p>District 1</p>
        </div>
      HTML
  end

  include_examples 'a page with layout', {
    template: 'pages/zones',
    content: ['Test Area', 'District 1']
  }
end
