class PwaController < ApplicationController
  def service_worker
    render file: 'app/javascript/service_worker.js', content_type: 'application/javascript'
  end

  def manifest
    render file: 'app/javascript/manifest.json', content_type: 'application/json'
  end
end 