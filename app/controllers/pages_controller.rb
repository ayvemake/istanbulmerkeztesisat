class PagesController < ApplicationController
  def home
    @tesisat_services = Service.where(category: 'tesisat').active
    @boya_services = Service.where(category: 'boya').active
  end

  def about
  end

  def zones
  end

  def technical_info
    @page_title = "Teknik Bilgiler"
  end
end
