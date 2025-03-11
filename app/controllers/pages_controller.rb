require 'ostruct'

class PagesController < ApplicationController
  def home
    @service_areas = ServiceArea.all
  end

  def about
  end

  private

  def service_galleries_data
    {
      tesisat: {
        general: [
          { url: 'sanitary/general/general1.webp', title: 'Tesisat Tamiri' },
          { url: 'sanitary/general/general2.webp', title: 'Lavabo Montajı' },
          { url: 'sanitary/general/general3.webp', title: 'Tesisat Yenileme' }
        ],
        thermal: [
          { url: 'sanitary/thermal/thermal1.webp', title: 'Termal Kamera' },
          { url: 'sanitary/thermal/thermal2.webp', title: 'Kaçak Tespiti' },
          { url: 'sanitary/thermal/thermal3.webp', title: 'Su Kaçağı Onarımı' }
        ],
        unblock: [
          { url: 'sanitary/unblock/unblock1.webp', title: 'Robotlu Açma' },
          { url: 'sanitary/unblock/unblock2.webp', title: 'Kanal Görüntüleme' },
          { url: 'sanitary/unblock/unblock3.webp', title: 'Gider Temizleme' }
        ]
      },
      boya: {
        renovate: [
          { url: 'paint/renovate/renovate1.webp', title: 'İç Cephe Boyama' },
          { url: 'paint/renovate/renovate2.webp', title: 'Dış Cephe Boyama' },
          { url: 'paint/renovate/renovate3.webp', title: 'Dekoratif Boya' }
        ]
      }
    }
  end

  def unblock_images_data
    [
      { url: 'sanitary/unblock/unblock1.webp', title: 'Robotlu Tıkanıklık Açma' },
      { url: 'sanitary/unblock/unblock2.webp', title: 'Kameralı Görüntüleme' },
      { url: 'sanitary/unblock/unblock3.webp', title: 'Gider Temizleme' },
      { url: 'sanitary/unblock/unblock4.webp', title: 'Kanal Açma' }
    ]
  end

  def service_areas_data
    ServiceArea.all
  end
end
