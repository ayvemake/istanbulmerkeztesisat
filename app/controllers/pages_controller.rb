require 'ostruct'

class PagesController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def home
    @thermal_images = thermal_images_data
    @tesisat_services = tesisat_services_data
    @boya_services = boya_services_data
    @featured_services = featured_services_data
    @testimonials = testimonials_data
    @service_galleries = service_galleries_data
    @unblock_images = unblock_images_data
    skip_authorization
  end

  def about
    skip_authorization
  end

  def zones
    @service_areas = service_areas_data
    skip_authorization
  end

  def technical_info
    @page_title = 'Teknik Bilgiler'
    skip_authorization
  end

  # Ajout de l'action teknikler
  def teknikler
    skip_authorization
    render layout: 'application'
  end

  private

  def thermal_images_data
    [
      { url: 'thermal/thermal1.webp', title: 'Termal Kamera ile Su Kaçağı Tespiti' },
      { url: 'thermal/thermal2.webp', title: 'Hassas Kaçak Tespiti' },
      { url: 'thermal/thermal3.webp', title: 'Noktasal Tespit' }
    ]
  end

  def tesisat_services_data
    load_service_data('tesisat').map do |service_data|
      # Convertir les clés en symboles et transformer les données
      transformed_data = service_data.transform_keys(&:to_sym).merge(
        service_advantages: build_service_advantages(service_data['advantages'])
      )
      # Supprimer les advantages bruts car ils ont été transformés
      transformed_data.delete(:advantages)

      ServicePreview.create(transformed_data)
    end
  end

  def load_service_data(category)
    YAML.load_file(Rails.root.join('config', 'data', 'services.yml'))[category]
  end

  def build_service_advantages(advantages)
    return [] unless advantages

    advantages.map do |adv|
      ServiceAdvantagePreview.create(
        adv.transform_keys(&:to_sym)
      )
    end
  end

  def boya_services_data
    load_service_data('boya').map do |service_data|
      # Convertir les clés en symboles et transformer les données
      transformed_data = service_data.transform_keys(&:to_sym).merge(
        service_advantages: build_service_advantages(service_data['advantages'])
      )
      # Supprimer les advantages bruts car ils ont été transformés
      transformed_data.delete(:advantages)

      ServicePreview.create(transformed_data)
    end
  end

  def featured_services_data
    Service.featured
           .with_attached_image
           .with_attached_gallery_images
           .to_a
  end

  def testimonials_data
    [
      ServiceReviewPreview.create(
        name: 'Ahmet Y.',
        content: 'Çok profesyonel ve hızlı hizmet. Teşekkürler!',
        rating: 5,
        created_at: 2.days.ago,
        image_url: nil
      ),
      ServiceReviewPreview.create(
        name: 'Mehmet K.',
        content: 'Kaliteli iş, uygun fiyat. Tavsiye ederim.',
        rating: 5,
        created_at: 5.days.ago,
        image_url: nil
      ),
      ServiceReviewPreview.create(
        name: 'Ayşe S.',
        content: 'Temiz ve düzenli çalışma. Memnun kaldım.',
        rating: 4,
        created_at: 1.week.ago,
        image_url: nil
      )
    ]
  end

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
      {
        url: 'sanitary/unblock/unblock1.webp',
        title: 'Robotlu Tıkanıklık Açma'
      },
      {
        url: 'sanitary/unblock/unblock2.webp',
        title: 'Kameralı Görüntüleme'
      },
      {
        url: 'sanitary/unblock/unblock3.webp',
        title: 'Gider Temizleme'
      },
      {
        url: 'sanitary/unblock/unblock4.webp',
        title: 'Kanal Açma'
      }
    ]
  end

  def service_areas_data
    [
      TestModels::ServiceArea.new(
        name: 'Test Area',
        districts: ['District 1', 'District 2']
      )
    ]
  end
end
