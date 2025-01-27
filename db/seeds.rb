puts "Création des services..."

# Nettoyage des données existantes
Service.destroy_all
ServiceAdvantage.destroy_all

# Fonction helper pour créer un service avec ses avantages
def create_service_with_advantages(service_data)
  advantages_data = service_data.delete(:advantages)
  service = Service.create!(service_data)
  
  advantages_data.each do |advantage_data|
    service.service_advantages.create!(advantage_data)
  end
  
  puts "Created #{service.name}"
end

# Services de plomberie
tesisat_services = [
  {
    name: 'Su Kaçağı Tespiti',
    description: 'Kırmadan dökmeden son teknoloji cihazlarla su kaçağı tespiti yapıyoruz. Termal kamera ve akustik dinleme cihazları ile noktasal tespit.',
    category: 'tesisat',
    urgent: true,
    available_24_7: true,
    featured: true,
    advantages: [
      { title: 'Kırmadan Tespit', description: 'Duvarlara zarar vermeden tespit' },
      { title: 'Termal Kamera', description: 'Son teknoloji cihazlarla tespit' },
      { title: 'Aynı Gün Müdahale', description: 'Hızlı ve profesyonel çözüm' }
    ]
  },
  {
    name: 'Tıkanıklık Açma',
    description: 'Robotik cihazlarla tüm tıkanıklıkları açıyoruz. Lavabo, tuvalet, gider ve kanal tıkanıklıkları için profesyonel çözüm.',
    category: 'tesisat',
    urgent: true,
    available_24_7: true,
    advantages: [
      { title: 'Robot Cihaz', description: 'Profesyonel ekipmanlarla müdahale' },
      { title: 'Garantili İşçilik', description: 'Kalıcı çözüm garantisi' },
      { title: '7/24 Hizmet', description: 'Her an yanınızdayız' }
    ]
  },
  {
    name: 'Petek Temizleme',
    description: 'Özel kimyasallar ve basınçlı su ile petek temizliği yapıyoruz. Isınma sorunlarına kesin çözüm.',
    category: 'tesisat',
    featured: true,
    advantages: [
      { title: 'Özel Kimyasal', description: 'Peteklere zarar vermeyen çözüm' },
      { title: 'Tasarruf', description: 'Yakıt tasarrufu sağlar' },
      { title: 'Tam Verim', description: 'Maksimum ısınma garantisi' }
    ]
  },
  {
    name: 'Tuvalet Tamiri',
    description: 'Profesyonel tuvalet ve lavabo tamiri hizmetleri',
    category: 'tesisat',
    detailed_description: 'Her türlü tuvalet ve lavabo tamiri için profesyonel çözümler sunuyoruz. Tıkanıklık açma, sifon değişimi, rezervuar tamiri gibi tüm hizmetleri garantili olarak yapıyoruz. Deneyimli ekibimiz, modern ekipmanlarla hızlı ve kalıcı çözümler üretir.',
    work_steps: [
      { title: 'İnceleme', description: 'Sorunun detaylı tespiti' },
      { title: 'Çözüm Önerisi', description: 'En uygun çözümün belirlenmesi' },
      { title: 'Fiyat Teklifi', description: 'Şeffaf fiyatlandırma' },
      { title: 'Tamir', description: 'Profesyonel tamir işlemi' },
      { title: 'Test', description: 'Çalışma testi' }
    ],
    equipment: [
      { name: 'Kanal Açma', description: 'Tıkanıklık açma cihazı' },
      { name: 'Kamera', description: 'Görüntülü tespit cihazı' },
      { name: 'El Aletleri', description: 'Profesyonel tamir aletleri' }
    ],
    advantages: [
      { title: 'Hızlı Servis', description: '30 dakika içinde müdahale' },
      { title: 'Uygun Fiyat', description: 'Rekabetçi fiyatlar' },
      { title: 'Garantili İş', description: '1 yıl işçilik garantisi' }
    ]
  },
  {
    name: 'Kalorifer Tesisatı',
    description: 'Kalorifer tesisatı kurulum ve bakım hizmetleri',
    category: 'tesisat',
    detailed_description: 'Merkezi sistem ve bireysel kalorifer tesisatı kurulum, bakım ve onarım hizmetleri sunuyoruz. Enerji verimliliği yüksek, modern sistemlerle evinizi ısıtıyoruz.',
    work_steps: [
      { title: 'Proje', description: 'Detaylı sistem projesi' },
      { title: 'Malzeme Seçimi', description: 'Kaliteli malzeme temini' },
      { title: 'Montaj', description: 'Profesyonel montaj' },
      { title: 'Test', description: 'Sistem testi ve ayarlar' }
    ],
    equipment: [
      { name: 'Kaynak Makinesi', description: 'Profesyonel kaynak ekipmanı' },
      { name: 'Test Cihazları', description: 'Basınç ve sıcaklık ölçüm' },
      { name: 'El Aletleri', description: 'Özel montaj aletleri' }
    ],
    advantages: [
      { title: 'Enerji Tasarrufu', description: 'Verimli sistem tasarımı' },
      { title: 'Uzun Ömür', description: '15 yıl sistem garantisi' },
      { title: 'Profesyonel Ekip', description: 'Sertifikalı ustalar' }
    ]
  },
  {
    name: 'Doğalgaz Tesisatı',
    description: 'Doğalgaz tesisatı kurulum ve bakım',
    category: 'tesisat',
    detailed_description: 'İGDAŞ onaylı doğalgaz tesisatı kurulum, bakım ve proje hizmetleri. Güvenli ve standartlara uygun doğalgaz tesisatı için uzman kadromuzla hizmetinizdeyiz.',
    work_steps: [
      { title: 'Proje Çizimi', description: 'İGDAŞ onaylı proje' },
      { title: 'Malzeme Temini', description: 'TSE belgeli malzemeler' },
      { title: 'Montaj', description: 'Standartlara uygun montaj' },
      { title: 'Test ve Onay', description: 'Gaz açma işlemleri' }
    ],
    equipment: [
      { name: 'Gaz Dedektörü', description: 'Hassas kaçak tespiti' },
      { name: 'Kaynak Ekipmanı', description: 'Sertifikalı kaynak makinesi' },
      { name: 'Test Cihazları', description: 'Basınç test ekipmanları' }
    ],
    advantages: [
      { title: 'Sertifikalı Hizmet', description: 'İGDAŞ onaylı işlem' },
      { title: 'Güvenlik', description: 'TSE standartlarına uygun' },
      { title: '7/24 Destek', description: 'Acil müdahale hizmeti' }
    ]
  }
]

# Services de peinture
boya_services = [
  {
    name: 'İç Cephe Boyama',
    description: 'Profesyonel ekibimizle evinizin iç cephesini boyuyoruz. Su bazlı, silinebilir ve anti-bakteriyel boya seçenekleri.',
    category: 'boya',
    featured: true,
    advantages: [
      { title: 'Kaliteli Boya', description: 'A+ kalite boya kullanımı' },
      { title: 'Temiz İşçilik', description: 'Titiz ve özenli çalışma' },
      { title: 'Garanti', description: '2 yıl işçilik garantisi' }
    ]
  },
  {
    name: 'Dış Cephe Boyama',
    description: 'Binanızın dış cephesini profesyonel ekipmanlarla boyuyoruz. Silikon ve su bazlı özel dış cephe boyaları.',
    category: 'boya',
    featured: true,
    advantages: [
      { title: 'Uzman Ekip', description: 'Deneyimli boyacılar' },
      { title: 'Özel Boya', description: 'Dış etkenlere dayanıklı' },
      { title: 'Uygun Fiyat', description: 'Rekabetçi fiyatlar' }
    ]
  },
  {
    name: 'Dekoratif Boya',
    description: 'İtalyan sıva, efekt boya ve özel desenli uygulamalar. Evinize özel tasarım ve renk seçenekleri.',
    category: 'boya',
    advantages: [
      { title: 'Özel Tasarım', description: 'Size özel desenler' },
      { title: 'Kaliteli Malzeme', description: 'İthal ürün kullanımı' },
      { title: 'Profesyonel', description: 'Uzman uygulama' }
    ]
  },
  {
    name: 'Ahşap Boyama',
    description: 'Ahşap yüzey boyama ve vernik',
    category: 'boya',
    detailed_description: 'Mobilya, kapı, pencere ve tüm ahşap yüzeyleriniz için profesyonel boyama ve vernik hizmetleri. Uzun ömürlü ve estetik sonuçlar için kaliteli malzemeler kullanıyoruz.',
    work_steps: [
      { title: 'Yüzey Hazırlığı', description: 'Zımpara ve temizlik' },
      { title: 'Astar', description: 'Koruyucu astar' },
      { title: 'Boya/Vernik', description: 'Ana uygulama' },
      { title: 'Son Kat', description: 'Koruyucu son kat' }
    ],
    equipment: [
      { name: 'Zımpara Makinesi', description: 'Profesyonel zımpara' },
      { name: 'Boya Tabancası', description: 'HVLP boya tabancası' },
      { name: 'Kurutma Sistemi', description: 'Hızlı kuruma sistemi' }
    ],
    advantages: [
      { title: 'Uzun Ömür', description: 'Dayanıklı malzemeler' },
      { title: 'Pürüzsüz Yüzey', description: 'Profesyonel sonuç' },
      { title: 'Çevre Dostu', description: 'Su bazlı ürünler' }
    ]
  }
]

# Création des services
puts "Creating tesisat services..."
tesisat_services.each { |service_data| create_service_with_advantages(service_data) }

puts "Creating boya services..."
boya_services.each { |service_data| create_service_with_advantages(service_data) }

puts "Services créés avec succès !"
puts "Created #{Service.count} services with #{ServiceAdvantage.count} advantages"

# Création de quelques demandes de test
puts "Creating customer inquiries..."
CustomerInquiry.create!([
  {
    name: "Ahmet Yılmaz",
    phone: "0532 111 2233",
    email: "ahmet@example.com",
    service_type: "Tesisat",
    message: "Mutfak lavabosunda tıkanıklık var",
    urgent: true
  },
  {
    name: "Ayşe Demir",
    phone: "0533 444 5566",
    email: "ayse@example.com",
    service_type: "Boya",
    message: "Salon duvarları için boya teklifi almak istiyorum",
    urgent: false
  }
])

puts "Created #{CustomerInquiry.count} customer inquiries"

puts "Creating thermal images..."
ThermalImage.create!([
  {
    title: 'Termal Kamera ile Su Kaçağı Tespiti',
    description: 'Duvar içindeki su kaçağının termal kamera ile tespiti',
    image_url: 'sanitary/thermal/thermal1.webp',
    featured: true,
    display_order: 1
  },
  {
    title: 'Hassas Kaçak Tespiti',
    description: 'Milimetrik hassasiyette su kaçağı tespiti',
    image_url: 'sanitary/thermal/thermal2.webp',
    featured: true,
    display_order: 2
  },
  {
    title: 'Noktasal Tespit',
    description: 'Su kaçağının tam yerinin belirlenmesi',
    image_url: 'sanitary/thermal/thermal3.webp',
    featured: false,
    display_order: 3
  }
])
puts "Created #{ThermalImage.count} thermal images" 

