require 'rails_helper'

RSpec.describe 'pages/about', type: :view do
  it 'renders the about page' do
    render
    expect(rendered).to include('Hakkımızda')
  end
end
