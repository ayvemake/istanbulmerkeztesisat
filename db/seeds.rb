puts "Création des services..."

# Nettoyage des données existantes
Service.destroy_all

# Services de plomberie
[
  {
    name: 'Su Kaçağı Tespiti',
    description: 'Kameralı cihazlarla su kaçağı tespiti ve tamiri',
    category: 'tesisat',
    detailed_description: 'Modern cihazlarla kırmadan su kaçağı tespiti yapıyoruz. Termal kamera ve akustik dinleme cihazları ile su kaçağının yerini hassas şekilde belirleyip, minimum müdahale ile tamir ediyoruz. Profesyonel ekibimiz, son teknoloji cihazlarla su kaçağını tespit eder ve en uygun çözümü sunar.',
    work_steps: [
      { title: 'Keşif', description: 'Ücretsiz keşif yapıyoruz' },
      { title: 'Tespit', description: 'Kameralı cihazlarla kaçak tespiti' },
      { title: 'Analiz', description: 'Sorunun kapsamını belirleme' },
      { title: 'Tamir', description: 'Kırmadan su kaçağı tamiri' },
      { title: 'Kontrol', description: 'Son kontroller ve test' }
    ],
    equipment: [
      { name: 'Termal Kamera', description: 'Su kaçağı tespiti için' },
      { name: 'Akustik Dinleme', description: 'Ses ile kaçak tespiti' },
      { name: 'Nem Ölçer', description: 'Nem seviyesi ölçümü' },
      { name: 'Endoskopik Kamera', description: 'Boru içi görüntüleme' }
    ],
    advantages: [
      { title: 'Kırmadan Tespit', description: 'Duvarlarınıza zarar vermeden tespit' },
      { title: 'Garantili Hizmet', description: '2 yıl garanti' },
      { title: 'Hızlı Müdahale', description: '30 dakika içinde yerindeyiz' },
      { title: 'Uygun Fiyat', description: 'Rekabetçi fiyatlar' }
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
    name: 'Petek Temizliği',
    description: 'Kimyasal petek temizleme hizmeti',
    category: 'tesisat',
    detailed_description: 'Peteklerinizin verimini artırmak için profesyonel kimyasal temizlik hizmeti sunuyoruz. Özel ekipmanlar ve çevre dostu kimyasallarla peteklerinizi temizliyor, ısınma verimliliğini artırıyoruz.',
    work_steps: [
      { title: 'Kontrol', description: 'Sistem kontrolü' },
      { title: 'Temizlik', description: 'Kimyasal temizlik' },
      { title: 'Durulama', description: 'Sistem durulama' },
      { title: 'Test', description: 'Verimlilik testi' }
    ],
    equipment: [
      { name: 'Temizleme Pompası', description: 'Özel temizleme pompası' },
      { name: 'Kimyasallar', description: 'Çevre dostu temizleyiciler' },
      { name: 'Test Cihazı', description: 'Verim ölçüm cihazı' }
    ],
    advantages: [
      { title: 'Enerji Tasarrufu', description: '%25\'e varan tasarruf' },
      { title: 'Uzman Ekip', description: 'Deneyimli teknisyenler' },
      { title: 'Garantili Hizmet', description: '1 yıl garanti' }
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
].each do |service|
  Service.create!(service)
end

# Services de peinture
[
  {
    name: 'İç Cephe Boyama',
    description: 'Profesyonel iç mekan boyama hizmetleri',
    category: 'boya',
    detailed_description: 'Evinizin iç mekanlarını profesyonel ekibimizle boyuyoruz. En kaliteli boyaları kullanarak, mobilyalarınızı koruyarak temiz ve titiz bir iş çıkarıyoruz. Duvar hazırlığından son kat boyaya kadar tüm işlemleri özenle yapıyoruz.',
    work_steps: [
      { title: 'Keşif', description: 'Ücretsiz keşif ve ölçüm' },
      { title: 'Hazırlık', description: 'Yüzey hazırlığı ve temizlik' },
      { title: 'Astar', description: 'Astar boya uygulaması' },
      { title: 'Boyama', description: 'Son kat boya uygulaması' },
      { title: 'Temizlik', description: 'Detaylı temizlik' }
    ],
    equipment: [
      { name: 'Boya Makinesi', description: 'Profesyonel boya püskürtme' },
      { name: 'El Aletleri', description: 'Kaliteli fırça ve rulolar' },
      { name: 'Koruma Ekipmanları', description: 'Mobilya koruma malzemeleri' }
    ],
    advantages: [
      { title: 'Kaliteli Malzeme', description: 'A+ kalite boya kullanımı' },
      { title: 'Temiz İş', description: 'Mobilyalarınızı koruyoruz' },
      { title: 'Garantili Hizmet', description: '2 yıl garanti' },
      { title: 'Hızlı Teslimat', description: 'Zamanında teslim' }
    ]
  },
  {
    name: 'Dış Cephe Boyama',
    description: 'Dış cephe boya ve mantolama hizmetleri',
    category: 'boya',
    detailed_description: 'Binanızın dış cephesini profesyonel ekibimizle boyuyor ve mantolama yapıyoruz. Hava koşullarına dayanıklı, uzun ömürlü boyalar kullanarak binanızın değerini artırıyoruz.',
    work_steps: [
      { title: 'Keşif', description: 'Detaylı keşif ve ölçüm' },
      { title: 'Hazırlık', description: 'Yüzey hazırlığı' },
      { title: 'Mantolama', description: 'Isı yalıtımı uygulaması' },
      { title: 'Boyama', description: 'Dış cephe boyama' }
    ],
    equipment: [
      { name: 'İskele Sistemi', description: 'Güvenli çalışma iskelesi' },
      { name: 'Boya Makinesi', description: 'Endüstriyel boya makinesi' },
      { name: 'Yalıtım Ekipmanları', description: 'Mantolama ekipmanları' }
    ],
    advantages: [
      { title: 'Enerji Tasarrufu', description: 'Isı yalıtımı ile tasarruf' },
      { title: 'Uzun Ömür', description: '10 yıl dayanıklılık' },
      { title: 'Profesyonel Ekip', description: 'Uzman uygulama ekibi' }
    ]
  },
  {
    name: 'Dekoratif Boya',
    description: 'Özel efekt ve dekoratif boya uygulamaları',
    category: 'boya',
    detailed_description: 'İtalyan efekt boyası, lake boya ve özel desenli uygulamalar ile mekanlarınıza estetik bir görünüm kazandırıyoruz. Uzman ekibimizle modern ve klasik tarzda dekoratif boya hizmetleri sunuyoruz.',
    work_steps: [
      { title: 'Konsept Belirleme', description: 'Tasarım danışmanlığı' },
      { title: 'Numune Uygulama', description: 'Örnek çalışma' },
      { title: 'Yüzey Hazırlığı', description: 'Özel astar uygulaması' },
      { title: 'Efekt Uygulama', description: 'Profesyonel uygulama' }
    ],
    equipment: [
      { name: 'Özel Fırçalar', description: 'İtalyan efekt fırçaları' },
      { name: 'Efekt Aletleri', description: 'Desen uygulama aletleri' },
      { name: 'LED Aydınlatma', description: 'Detay çalışma ışıkları' }
    ],
    advantages: [
      { title: 'Özel Tasarım', description: 'Size özel desenler' },
      { title: 'Kaliteli Malzeme', description: 'İthal efekt boyaları' },
      { title: 'Uzman Kadro', description: 'Sertifikalı ustalar' }
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
].each do |service|
  Service.create!(service)
end

puts "Services créés avec succès !" 