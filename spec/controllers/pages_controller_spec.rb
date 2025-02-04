require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  describe 'GET #home' do
    before do
      get :home
    end

    it 'returns http success', :aggregate_failures do
      expect(response).to have_http_status(:success)
    end

    it 'assigns thermal images', :aggregate_failures do
      expect(assigns(:thermal_images)).to be_an(Array)
      expect(assigns(:thermal_images)).not_to be_empty
    end

    it 'assigns service previews', :aggregate_failures do
      expect(assigns(:tesisat_services)).to be_an(Array)
      expect(assigns(:tesisat_services).first).to be_a(ServicePreview)
      expect(assigns(:boya_services)).to be_an(Array)
      expect(assigns(:boya_services).first).to be_a(ServicePreview)
    end
  end

  describe 'GET #about' do
    it 'returns http success' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #zones' do
    it 'returns http success' do
      get :zones
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #technical_info' do
    it 'returns http success and sets page title', :aggregate_failures do
      get :technical_info
      expect(response).to have_http_status(:success)
      expect(assigns(:page_title)).to eq('Teknik Bilgiler')
    end
  end
end
