require 'ostruct'

class PagesController < ApplicationController
  def home
    @thermal_images = [
      {
        url: "thermal/thermal1.webp",
        title: "Termal Kamera ile Su Kaçağı Tespiti"
      },
      {
        url: "thermal/thermal2.webp",
        title: "Hassas Kaçak Tespiti"
      },
      {
        url: "thermal/thermal3.webp",
        title: "Noktasal Tespit"
      }
    ]

    @tesisat_services = [
      OpenStruct.new(
        name: "Kameralı Su Kaçağı Tespiti",
        description: "Termal kamera ve akustik dinleme cihazları ile noktasal tespit, kırmadan dökmeden çözüm.",
        category: "tesisat",
        urgent: true,
        available_24_7: true,
        first_image: "sanitary/thermal/thermal1.webp",
        service_advantages: [
          OpenStruct.new(
            title: "Termal Kamera",
            description: "Son teknoloji cihazlarla tespit"
          ),
          OpenStruct.new(
            title: "Kırmadan Tespit",
            description: "Duvarlara zarar vermeden tespit"
          )
        ]
      ),
      OpenStruct.new(
        name: "Tıkanıklık Açma Servisi",
        description: "Robotlu ve kameralı tıkanıklık açma, gider açma ve kanal temizleme hizmetleri.",
        category: "tesisat",
        urgent: true,
        available_24_7: true,
        first_image: "sanitary/unblock/unblock1.webp",
        service_advantages: [
          OpenStruct.new(
            title: "Robotlu Açma",
            description: "Modern cihazlarla tıkanıklık açma"
          ),
          OpenStruct.new(
            title: "Kameralı Tespit",
            description: "Görüntülü tespit ve müdahale"
          )
        ]
      )
    ]

    @boya_services = [
      OpenStruct.new(
        name: "İç Cephe Boyama",
        description: "Profesyonel iç mekan boyama, alçı, macun ve dekoratif boya uygulamaları.",
        category: "boya",
        urgent: false,
        available_24_7: false,
        first_image: "paint/renovate/renovate1.webp",
        service_advantages: [
          OpenStruct.new(
            title: "Hazırlık İşlemleri",
            description: "Alçı, macun ve zımpara işlemleri"
          ),
          OpenStruct.new(
            title: "Kaliteli Malzeme",
            description: "1. sınıf boya ve malzeme kullanımı"
          )
        ]
      ),
      OpenStruct.new(
        name: "Dış Cephe Boyama",
        description: "Bina dış cephe boyama, mantolama ve izolasyon hizmetleri.",
        category: "boya",
        urgent: false,
        available_24_7: false,
        first_image: "paint/renovate/renovate2.webp",
        service_advantages: [
          OpenStruct.new(
            title: "Mantolama",
            description: "Isı yalıtımı ve mantolama"
          ),
          OpenStruct.new(
            title: "Su İzolasyonu",
            description: "Dış cephe su yalıtımı"
          )
        ]
      )
    ]

    @featured_services = Service.featured
      .with_attached_image
      .with_attached_gallery_images
      .to_a
    
    # Données statiques temporaires pour les témoignages
    @testimonials = [
      OpenStruct.new(
        name: "Ahmet Y.",
        content: "Çok profesyonel ve hızlı hizmet. Teşekkürler!",
        rating: 5,
        created_at: 2.days.ago,
        image_url: nil
      ),
      OpenStruct.new(
        name: "Mehmet K.",
        content: "Kaliteli iş, uygun fiyat. Tavsiye ederim.",
        rating: 5,
        created_at: 5.days.ago,
        image_url: nil
      ),
      OpenStruct.new(
        name: "Ayşe S.",
        content: "Temiz ve düzenli çalışma. Memnun kaldım.",
        rating: 4,
        created_at: 1.week.ago,
        image_url: nil
      )
    ]

    # Galerie d'images pour chaque service
    @service_galleries = {
      tesisat: {
        general: [
          { url: "sanitary/general/general1.webp", title: "Tesisat Tamiri" },
          { url: "sanitary/general/general2.webp", title: "Lavabo Montajı" },
          { url: "sanitary/general/general3.webp", title: "Tesisat Yenileme" }
        ],
        thermal: [
          { url: "sanitary/thermal/thermal1.webp", title: "Termal Kamera" },
          { url: "sanitary/thermal/thermal2.webp", title: "Kaçak Tespiti" },
          { url: "sanitary/thermal/thermal3.webp", title: "Su Kaçağı Onarımı" }
        ],
        unblock: [
          { url: "sanitary/unblock/unblock1.webp", title: "Robotlu Açma" },
          { url: "sanitary/unblock/unblock2.webp", title: "Kanal Görüntüleme" },
          { url: "sanitary/unblock/unblock3.webp", title: "Gider Temizleme" }
        ]
      },
      boya: {
        renovate: [
          { url: "paint/renovate/renovate1.webp", title: "İç Cephe Boyama" },
          { url: "paint/renovate/renovate2.webp", title: "Dış Cephe Boyama" },
          { url: "paint/renovate/renovate3.webp", title: "Dekoratif Boya" }
        ]
      }
    }

    # Ajouter après @thermal_images
    @unblock_images = [
      {
        url: "sanitary/unblock/unblock1.webp",
        title: "Robotlu Tıkanıklık Açma"
      },
      {
        url: "sanitary/unblock/unblock2.webp",
        title: "Kameralı Görüntüleme"
      },
      {
        url: "sanitary/unblock/unblock3.webp",
        title: "Gider Temizleme"
      },
      {
        url: "sanitary/unblock/unblock4.webp",
        title: "Kanal Açma"
      }
    ]
  end

  def about
  end

  def zones
  end

  def technical_info
    @page_title = "Teknik Bilgiler"
  end

  # Ajout de l'action teknikler
  def teknikler
    render layout: 'application'
  end
end
