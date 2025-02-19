require 'ostruct'

class PagesController < ApplicationController
  def home
    @advantages = Advantage.all
    @thermal_images = ThermalImage.all
    @customer_inquiry = CustomerInquiry.new
    @tesisat_services = tesisat_services_data
    @boya_services = boya_services_data
    @featured_services = featured_services_data
    @testimonials = testimonials_data
    @service_galleries = service_galleries_data
    @unblock_images = unblock_images_data
    @service_areas = service_areas_data
  end

  def about
    @advantages = Advantage.all
  end

  def zones
    @service_areas = service_areas_data
  end

  def technical_info
    @page_title = 'Teknik Bilgiler'
  end

  def teknikler
    render layout: 'application'
  end

  def contact
    @contact = Contact.new
  end

  def services
    @advantages = Advantage.all
    @customer_inquiry = CustomerInquiry.new
  end

  def privacy_policy
  end

  def terms_of_service
  end

  private

  def tesisat_services_data
    load_service_data('tesisat').map do |service_data|
      transformed_data = service_data.transform_keys(&:to_sym).merge(
        service_advantages: build_service_advantages(service_data['advantages'])
      )
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
      transformed_data = service_data.transform_keys(&:to_sym).merge(
        service_advantages: build_service_advantages(service_data['advantages'])
      )
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
