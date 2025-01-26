require 'ostruct'

class PagesController < ApplicationController
  def home
    @tesisat_services = Service.tesisat.active
    @boya_services = Service.boya.active
    @featured_services = [
      OpenStruct.new(
        category: 'tesisat',
        name: 'Su Kaçağı Tespiti',
        description: 'Kameralı ve cihazlı su kaçağı tespiti, noktasal tespit.'
      ),
      OpenStruct.new(
        category: 'tesisat',
        name: 'Tıkanıklık Açma',
        description: 'Robotlu ve kameralı tıkanıklık açma hizmeti.'
      ),
      OpenStruct.new(
        category: 'tesisat',
        name: 'Petek Temizliği',
        description: 'Kimyasal ile petek temizliği ve bakım hizmeti.'
      ),
      OpenStruct.new(
        category: 'tesisat',
        name: 'Tadilat ve Yenileme',
        description: 'Komple tesisat yenileme ve tadilat işleri.'
      ),
      OpenStruct.new(
        category: 'boya',
        name: 'İç Cephe Boyama',
        description: 'Profesyonel iç cephe boya ve tadilat işleri.'
      ),
      OpenStruct.new(
        category: 'boya',
        name: 'Dış Cephe Boyama',
        description: 'Dış cephe boya ve mantolama hizmetleri.'
      ),
      OpenStruct.new(
        category: 'boya',
        name: 'Dekoratif Boya',
        description: 'Özel dekoratif boya uygulamaları.'
      )
    ].first(6)
  end

  def about
  end

  def zones
  end

  def technical_info
    @page_title = "Teknik Bilgiler"
  end
end
