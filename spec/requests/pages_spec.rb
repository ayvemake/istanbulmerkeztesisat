require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  before { skip_pundit }

  describe 'GET /home' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /about' do
    it 'returns http success' do
      get about_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /zones' do
    it 'returns http success' do
      get zones_path
      expect(response).to have_http_status(:success)
    end
  end
end
