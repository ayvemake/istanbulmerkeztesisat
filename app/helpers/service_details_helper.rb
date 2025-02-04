module ServiceDetailsHelper
  def service_detail_content(service_name)
    case service_name.downcase
    when /tıkanıklık/
      tikaniklik_service_details
    when /kaçak/
      kacak_service_details
    when /boya/
      boya_service_details
    else
      default_service_details
    end
  end

  private

  def tikaniklik_service_details
    {
      title: 'Tıkanıklık Açma Hizmeti',
      description: 'Profesyonel ekipmanlarla tıkanıklık açma',
      features: tikaniklik_features,
      advantages: tikaniklik_advantages
    }
  end

  def tikaniklik_features
    [
      'Kırmadan robotik cihazlarla açma',
      'Görüntüleme kamerası ile tespit',
      'Garantili çözüm'
    ]
  end

  def tikaniklik_advantages
    [
      { title: 'Hızlı Müdahale', description: '30 dakika içinde yerinde servis' },
      { title: 'Modern Ekipman', description: 'Son teknoloji cihazlar' }
    ]
  end

  def kacak_service_details
    {
      features: [
        {
          title: 'Kameralı Tespit',
          description: 'Özel kamera sistemleri ile noktasal tespit'
        },
        {
          title: 'Termal Kamera',
          description: 'Duvar içi sızıntıların termal görüntüleme ile tespiti'
        },
        {
          title: 'Ses Dinleme',
          description: 'Akustik dinleme cihazları ile kaçak noktası tespiti'
        }
      ],
      advantages: [
        'Tahribatsız tespit',
        'Kesin sonuç',
        'Hızlı müdahale'
      ],
      process: [
        'Ön inceleme ve durum tespiti',
        'Cihazlarla kaçak noktası tespiti',
        'Onarım planlaması',
        'Kaçak tamiri'
      ]
    }
  end

  def boya_service_details
    # Implementation of boya_service_details method
  end

  def default_service_details
    # Implementation of default_service_details method
  end
end
