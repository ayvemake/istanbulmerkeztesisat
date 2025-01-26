module ServiceDetailsHelper
  def service_detail_content(service_name)
    case service_name
    when 'Su Kaçağı Tespiti'
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
    when 'Tıkanıklık Açma'
      {
        features: [
          {
            title: 'Robotik Cihazlar',
            description: 'Modern cihazlarla tıkanıklık tespiti ve açma'
          },
          {
            title: 'Kırmadan Çözüm',
            description: 'Yapıya zarar vermeden müdahale'
          }
        ],
        advantages: [
          'Garantili çözüm',
          'Kalıcı sonuç',
          '7/24 hizmet'
        ],
        process: [
          'Tıkanıklık nedeni tespiti',
          'Uygun yöntem seçimi',
          'Tıkanıklık açma işlemi',
          'Test ve kontrol'
        ]
      }
    # ... autres services ...
    end
  end
end 