class HealthController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    render json: { status: 'ok' }, status: :ok
  end
end 