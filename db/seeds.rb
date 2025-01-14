# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Nettoyez les données existantes
puts "Veriler temizleniyor..."
[CustomerInquiry, Service, TeamMember, ServiceArea].each(&:destroy_all)

# Services de plomberie/sanitaire
plumbing_services = [
  {
    name: 'Su Kaçağı Tespiti ve Tamiri',
    description: 'Kameralı cihazlarla su kaçağı tespiti, noktasal tamir, boru değişimi ve yalıtım hizmetleri. Duvar ve zemin kırmadan tespit.',
    price: 250,
    service_type: 'plumbing',
    key_features: ['Kameralı tespit', 'Noktasal tamir', 'Garantili işçilik'],
    active: true
  },
  {
    name: 'Tuvalet ve Lavabo Tamiri',
    description: 'Tuvalet taşı değişimi, lavabo montajı, musluk tamiri, rezervuar tamiri ve değişimi, sifon tamiri gibi tüm banyo tesisat işleri.',
    price: 200,
    service_type: 'plumbing',
    key_features: ['Aynı gün servis', 'Orijinal yedek parça', 'Profesyonel ekip'],
    active: true
  },
  {
    name: 'Gider Açma ve Tıkanıklık',
    description: 'Robotik cihazlarla lavabo, tuvalet, banyo ve mutfak gideri açma. Kırmadan dökmeden tıkanıklık açma garantili hizmet.',
    price: 180,
    service_type: 'plumbing',
    key_features: ['Robotik cihaz', 'Kırmadan çözüm', 'Kalıcı çözüm'],
    active: true
  },
  {
    name: 'Pis Su Tesisatı',
    description: 'Pis su tesisatı döşeme, tamir ve yenileme. Bina içi ve dışı pis su hattı döşeme, logar ve rögar yapımı.',
    price: 350,
    service_type: 'plumbing',
    key_features: ['Komple tesisat', 'TSE standartları', 'Uzun ömürlü malzeme'],
    active: true
  }
]

# Services de peinture
painting_services = [
  {
    name: 'İç Cephe Boyama',
    description: 'Profesyonel iç cephe boyama hizmeti. Duvar hazırlığı, alçı, macun ve son kat boya uygulaması.',
    price: 40, # prix au m²
    service_type: 'painting',
    key_features: ['Ücretsiz keşif', 'Kaliteli boya', 'Temiz işçilik'],
    active: true
  },
  {
    name: 'Dış Cephe Boyama',
    description: 'Dış cephe boya ve mantolama hizmetleri. Bina dış cephesi için komple çözüm.',
    price: 60, # prix au m²
    service_type: 'painting',
    key_features: ['İskele kurulumu', 'Garantili uygulama', 'TSE standartları'],
    active: true
  },
  {
    name: 'Dekoratif Boya',
    description: 'İtalyan sıva, efekt boya ve özel dekoratif uygulamalar. Evinize özel tasarım çözümleri.',
    price: 80, # prix au m²
    service_type: 'painting',
    key_features: ['Özel tasarım', 'Profesyonel uygulama', 'Dayanıklı malzeme'],
    active: true
  }
]

# Création des services
(plumbing_services + painting_services).each do |service_attrs|
  Service.create!(service_attrs)
end

puts "Hizmetler başarıyla oluşturuldu!"
